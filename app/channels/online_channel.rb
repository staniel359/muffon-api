class OnlineChannel < ApplicationCable::Channel
  def subscribed
    update_profile_online(1)
  end

  def unsubscribed
    update_profile_online(0)
  end

  def update(data)
    online = data.dig(
      'payload', 'online'
    )

    update_profile_online(
      online
    )
  end

  private

  def update_profile_online(online)
    return if profile.blank?

    Muffon::Processor::Profile::Online::Updater.call(
      profile_id:,
      token:,
      online:
    )
  end

  def profile_id
    profile.id
  end

  def token
    profile.token
  end
end
