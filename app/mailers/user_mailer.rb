class UserMailer < ApplicationMailer
  queue_as :user_mailer

  # ...
end
