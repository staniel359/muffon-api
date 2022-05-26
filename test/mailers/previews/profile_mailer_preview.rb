class ProfileMailerPreview < ActionMailer::Preview
  def password_reset_email
    ProfileMailer.with(
      email: profile.email,
      code:
        profile.password_reset_code
    ).password_reset_email
  end

  def new_version_email
    ProfileMailer.with(
      email: profile.email
    ).new_version_email
  end

  private

  def profile
    @profile ||= Profile.first
  end
end
