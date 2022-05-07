class ApplicationMailer < ActionMailer::Base
  default from: -> { from_email }
  layout 'mailer'

  private

  def from_email
    ENV.fetch(
      'MUFFON_API_MAILER_EMAIL'
    )
  end
end
