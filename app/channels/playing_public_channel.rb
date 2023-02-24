class PlayingPublicChannel < ApplicationCable::Channel
  def subscribed; end

  def unsubscribed
    update_profile_playing(
      nil
    )
  end

  def update(data)
    playing = data.dig(
      'payload', 'playing'
    )

    update_profile_playing(
      playing
    )
  end

  private

  def update_profile_playing(playing)
    return if profile.blank?

    Muffon::Processor::Profile::Playing::Updater.call(
      profile_id:,
      token:,
      playing:
    )
  end
end
