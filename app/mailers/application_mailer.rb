class ApplicationMailer < ActionMailer::Base
  default from: -> { from_email }
  default 'Message-ID' => -> { message_id }
  layout 'mailer'

  private

  def from_email
    credentials.dig(
      :mailer,
      :email
    )
  end

  def credentials
    Rails
      .application
      .credentials
  end

  def message_id
    "<#{hash}@#{domain}>"
  end

  def hash
    SecureRandom.alphanumeric
  end

  def domain
    credentials.dig(
      :mailer,
      :domain
    )
  end
end
