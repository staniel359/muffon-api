module EventableTrack
  extend ActiveSupport::Concern

  include Eventable

  private

  def eventable_data
    { track: track_data }
  end

  def track_data
    {
      title: track.title,
      artist: {
        name: track.artist.name
      }
    }
  end
end
