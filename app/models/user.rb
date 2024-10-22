# frozen_string_literal: true

class User < ApplicationRecord
  # TODO: if we discover shared functionality, consider ActionSupport::Concerns as a method of organization
  # include Userable for example

  has_many :todo_lists, dependent: :destroy, inverse_of: :user
  has_many :todos, through: :todo_lists

  has_one :default_todo_list, ->(user) { user.todo_lists.default }, class_name: 'TodoList'

  # TODO: Be careful with callbacks.  They can create unintended bevhavior or bugs if not used properly
  after_create :create_default_todo_list
  # TODO: after_commit is dangerous!  Can dependent models also do things after commit it can cause subtle bugs
  after_commit :send_welcome_email, on: :create

  # TODO: Move me nto Userable! makes us ready to introduce more user types like an admin
  validates :name, presence: true
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true
  validates :token, presence: true, length: { is: 36 }, uniqueness: true
  validates :password_digest, presence: true, length: { is: 64 }

  private

    def create_default_todo_list
      todo_lists.create!(title: 'Default', default: true)
    end

    # TODO: Since there is no job runner configured, i believe this is running synchronously on thread?
    # this would be better in a background job so the user creation returns faster.
    def send_welcome_email
      UserMailer.with(user: self).welcome.deliver_later
    end
end
