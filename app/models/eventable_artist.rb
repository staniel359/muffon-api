module EventableArtist
  extend ActiveSupport::Concern

  include Eventable

  private

  def eventable_data
    { artist: artist_data }
  end

  def artist_data
    { name: artist.name }
  end
end
