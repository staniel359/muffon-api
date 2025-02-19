class OnlineChannel < ApplicationCable::Channel
  def subscribed
    update_profile_online(
      true
    )
  end

  def unsubscribed
    update_profile_online(
      false
    )
  end

  private

  def update_profile_online(
    boolean
  )
    return if profile.blank?

    online = (
      boolean ? 1 : 0
    )

    Muffon::Processor::Profile::Online::Updater.call(
      profile_id:,
      token:,
      online:
    )
  end
end
