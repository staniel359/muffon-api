class ProfileMailerPreview < ActionMailer::Preview
  def password_reset_email
    ProfileMailer.with(
      email:,
      code:
    ).password_reset_email
  end

  private

  def email
    profile.email
  end

  def profile
    @profile ||= Profile.first
  end

  def code
    profile.password_reset_code
  end
end
