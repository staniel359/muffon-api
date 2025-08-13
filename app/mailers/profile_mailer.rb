class ProfileMailer < ApplicationMailer
  EMAIL = 'foobar@gmail.com'.freeze

  def password_reset_email
    @text = password_reset_text

    mail(
      to: EMAIL,
      subject: password_reset_subject
    )
  end

  private

  def password_reset_text
    I18n.t(
      'mailer.passwordReset.text',
      code: code_formatted
    )
  end

  def code_formatted
    "<strong>#{code}</strong>"
  end

  def code
    SecureRandom.alphanumeric
  end

  def password_reset_subject
    I18n.t(
      'mailer.passwordReset.subject'
    )
  end
end
