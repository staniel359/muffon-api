class ProfileMailerPreview < ActionMailer::Preview
  TEST_EMAIL = 'foobar@gmail.com'.freeze

  def password_reset_email
    mailer.password_reset_email
  end

  private

  def mailer
    ProfileMailer.with(
      email: TEST_EMAIL,
      code:
    )
  end

  def code
    SecureRandom.alphanumeric
  end
end
