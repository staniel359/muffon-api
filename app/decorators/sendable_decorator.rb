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
    artists.map do |artist_data|
      artist_data_formatted(
        artist_data
      )
    end
  end

  def artist_data_formatted(
    artist_data
  )
    Muffon::Sendable::Artist.call(
      artist: artist_data
    )
  end

  def albums_formatted
    albums.map do |album_data|
      album_data_formatted(
        album_data
      )
    end
  end

  def album_data_formatted(
    album_data
  )
    Muffon::Sendable::Album.call(
      album: album_data
    )
  end

  def tracks_formatted
    tracks.map do |track_data|
      track_data_formatted(
        track_data
      )
    end
  end

  def track_data_formatted(
    track_data
  )
    Muffon::Sendable::Track.call(
      track: track_data
    )
  end

  def videos_formatted
    videos.map do |video_data|
      video_data_formatted(
        video_data
      )
    end
  end

  def video_data_formatted(
    video_data
  )
    Muffon::Sendable::Video.call(
      video: video_data
    )
  end

  def video_channels_formatted
    video_channels.map do |video_channel_data|
      video_channel_data_formatted(
        video_channel_data
      )
    end
  end

  def video_channel_data_formatted(
    video_channel_data
  )
    Muffon::Sendable::VideoChannel.call(
      channel: video_channel_data
    )
  end

  def video_playlists_formatted
    video_playlists.map do |video_playlist_data|
      video_playlist_data_formatted(
        video_playlist_data
      )
    end
  end

  def video_playlist_data_formatted(
    video_playlist_data
  )
    Muffon::Sendable::VideoPlaylist.call(
      playlist: video_playlist_data
    )
  end

  def playlists_formatted
    playlists.map do |playlist_data|
      playlist_data_formatted(
        playlist_data
      )
    end
  end

  def playlist_data_formatted(
    playlist_data
  )
    Muffon::Sendable::Playlist.call(
      playlist: playlist_data
    )
  end

  def communities_formatted
    communities.map do |community_data|
      community_data_formatted(
        community_data
      )
    end
  end

  def community_data_formatted(
    community_data
  )
    Muffon::Sendable::Community.call(
      community: community_data
    )
  end
end
