class ProfileMailer < ApplicationMailer
  def password_reset_email
    @text = text

    mail(
      to: email,
      subject:
    )
  end

  private

  def email
    params[:email]
  end

  def subject
    I18n.with_locale(locale) do
      I18n.t(
        'mailer.passwordReset.subject'
      )
    end
  end

  def locale
    params[:language]
  end

  def text
    I18n.with_locale(locale) do
      I18n.t(
        'mailer.passwordReset.text',
        code: params[:code]
      )
    end
  end
end
