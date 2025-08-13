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
    "<#{hash}@#{domain}>"
  end

  def hash
    SecureRandom.alphanumeric
  end

  def domain
    secrets.mailer[:domain]
  end
end
