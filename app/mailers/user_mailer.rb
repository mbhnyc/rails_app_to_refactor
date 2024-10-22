# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome
    user = params[:user]

    mail(
      to: user.email,
      body: "Hi #{user.name}, thanks for signing up...",
      subject: 'Welcome aboard',
      content_type: 'text/plain;charset=UTF-8',
    )

    # TODO: This is not great and unfriendly to our users, we should create a more attractice and inviting email to welcome users.
  end
end
