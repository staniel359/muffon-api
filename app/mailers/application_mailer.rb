class ApplicationMailer < ActionMailer::Base
  default from: -> { from_email }
  default 'Message-ID' => -> { message_id }
  layout 'mailer'

  private

  def from_email
    secrets.mailer[:email]
  end

  def secrets
    Rails.application.credentials
  end

  def message_id
    "<#{uuid}@#{domain}>"
  end

  def uuid
    SecureRandom.uuid
  end

  def domain
    secrets.mailer[:domain]
  end
end
