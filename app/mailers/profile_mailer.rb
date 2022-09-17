class ProfileMailer < ApplicationMailer
  def password_reset_email
    @text = password_reset_text

    mail(
      to: email,
      subject: password_reset_subject
    )
  end

  private

  def password_reset_text
    I18n.with_locale(locale) do
      I18n.t(
        'mailer.passwordReset.text',
        code: params[:code]
      )
    end
  end

  def locale
    params[:language]
  end

  def email
    params[:email]
  end

  def password_reset_subject
    I18n.with_locale(locale) do
      I18n.t(
        'mailer.passwordReset.subject'
      )
    end
  end
end
