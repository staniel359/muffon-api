class ApplicationMailer < ActionMailer::Base
  default from: -> { from_email }
  layout 'mailer'

  private

  def from_email
    secrets.mailer[:email]
  end

  def secrets
    Rails.application.credentials
  end
end
