class ProfileMailer < ApplicationMailer
  def password_reset_email
    I18n.with_locale(
      locale
    ) do
      @text = password_reset_text

      mail(
        to: email,
        subject: password_reset_subject
      )
    end
  end

  private

  def locale
    params[:locale]
  end

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
    params[:code]
  end

  def email
    params[:email]
  end

  def password_reset_subject
    I18n.t(
      'mailer.passwordReset.subject'
    )
  end
end
