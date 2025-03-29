module SendableDecorator
  def attachments_data
    attachment_types.index_with do |type|
      send("#{type}_formatted")
    end
      .compact_blank
      .presence
  end

  def attachments_minimal_data
    attachment_types.to_h do |type|
      [
        "with_#{type}",
        send(type).present?
      ]
    end.compact_blank
  end

  private

  def attachment_types
    Muffon::Utils::Sendable::ATTACHMENT_TYPES
  end

  def images_formatted
    images_data
  end

  def artists_formatted
    artists.map do |artist|
      artist_data_formatted(
        artist
      )
    end
  end

  def artist_data_formatted(
    artist
  )
    Muffon::Sendable::Artist.call(
      artist:
    )
  end

  def albums_formatted
    albums.map do |album|
      album_data_formatted(
        album
      )
    end
  end

  def album_data_formatted(
    album
  )
    Muffon::Sendable::Album.call(
      album:
    )
  end

  def tracks_formatted
    tracks.map do |track|
      track_data_formatted(
        track
      )
    end
  end

  def track_data_formatted(
    track
  )
    Muffon::Sendable::Track.call(
      track:
    )
  end

  def videos_formatted
    videos.map do |video|
      video_data_formatted(
        video
      )
    end
  end

  def video_data_formatted(
    video
  )
    Muffon::Sendable::Video.call(
      video:
    )
  end

  def video_channels_formatted
    video_channels.map do |channel|
      video_channel_data_formatted(
        channel
      )
    end
  end

  def video_channel_data_formatted(
    channel
  )
    Muffon::Sendable::VideoChannel.call(
      channel:
    )
  end

  def video_playlists_formatted
    video_playlists.map do |playlist|
      video_playlist_data_formatted(
        playlist
      )
    end
  end

  def video_playlist_data_formatted(
    playlist
  )
    Muffon::Sendable::VideoPlaylist.call(
      playlist:
    )
  end

  def playlists_formatted
    playlists.map do |playlist|
      playlist_data_formatted(
        playlist
      )
    end
  end

  def playlist_data_formatted(
    playlist
  )
    Muffon::Sendable::Playlist.call(
      playlist:
    )
  end

  def communities_formatted
    communities.map do |community|
      community_data_formatted(
        community
      )
    end
  end

  def community_data_formatted(
    community
  )
    Muffon::Sendable::Community.call(
      community:
    )
  end
end
