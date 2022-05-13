module SendableDecorator
  def attachments_data
    attachment_types.map do |t|
      [
        t,
        send("#{t}_formatted")
      ]
    end.to_h.compact_blank.presence
  end

  def attachments_minimal_data
    attachment_types.map do |t|
      [
        "with_#{t}",
        send(t).present?
      ]
    end.to_h.compact_blank
  end

  private

  def attachment_types
    Muffon::Utils::Sendable::ATTACHMENT_TYPES
  end

  def images_formatted
    images_data
  end

  def artists_formatted
    artists.map do |a|
      artist_data_formatted(a)
    end
  end

  def artist_data_formatted(artist)
    Muffon::Sendable::Artist.call(
      artist:
    )
  end

  def albums_formatted
    albums.map do |a|
      album_data_formatted(a)
    end
  end

  def album_data_formatted(album)
    Muffon::Sendable::Album.call(
      album:
    )
  end

  def tracks_formatted
    tracks.map do |t|
      track_data_formatted(t)
    end
  end

  def track_data_formatted(track)
    Muffon::Sendable::Track.call(
      track:
    )
  end

  def playlists_formatted
    playlists.map do |p|
      playlist_data_formatted(p)
    end
  end

  def playlist_data_formatted(playlist)
    Muffon::Sendable::Playlist.call(
      playlist:
    )
  end
end
