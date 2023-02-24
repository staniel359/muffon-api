class PlayingChannel < ApplicationCable::Channel
  def subscribed; end

  def unsubscribed; end

  def update(data)
    playing = data.dig(
      'payload', 'playing'
    )

    create_profile_playing_event(
      playing
    )
  end

  private

  def create_profile_playing_event(playing)
    return if profile.blank?

    profile
      .playing_events
      .create!(
        data: playing
      )
  end
end
