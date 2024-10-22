# frozen_string_literal: true

# TODO: consider roles for users so we can have permission to act as others

class UsersController < ApplicationController

  # TODO: move auth to before_action, except: create

  def create
    user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)

    password = user_params[:password].to_s.strip
    password_confirmation = user_params[:password_confirmation].to_s.strip

    errors = {}
    errors[:password] = ["can't be blank"] if password.blank?
    errors[:password_confirmation] = ["can't be blank"] if password_confirmation.blank?

    if errors.present?
      render_json(422, user: errors)
    else
      if password != password_confirmation
        render_json(422, user: { password_confirmation: ["doesn't match password"] })
      else
        password_digest = Digest::SHA256.hexdigest(password)

        user = User.new(
          name: user_params[:name],
          email: user_params[:email],
          token: SecureRandom.uuid,
          password_digest: password_digest
        )

        if user.save
          render_json(201, user: user.as_json(only: [:id, :name, :token]))
        else
          render_json(422, user: user.errors.as_json)
        end
      end
    end
  end

  def show
    perform_if_authenticated
  end

  def destroy
    perform_if_authenticated do
      current_user.destroy
    end
  end

  private

    def perform_if_authenticated(&block)
      authenticate_user do
        block.call if block

        render_json(200, user: { email: current_user.email })
      end
    end
end
