class ProfileMailer < ApplicationMailer
  def password_reset_email
    @text = password_reset_text

    mail(
      to: email,
      subject: password_reset_subject
    )
  end

  def new_version_email
    @text = new_version_text

    mail(
      bcc: emails,
      subject: new_version_subject
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

  def emails
    params[:emails]
  end

  def new_version_text
    I18n.with_locale('en') do
      I18n.t(
        'mailer.newVersion.text'
      )
    end
  end

  def new_version_subject
    I18n.with_locale('en') do
      I18n.t(
        'mailer.newVersion.subject'
      )
    end
  end
end
