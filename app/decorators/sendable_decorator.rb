module SendableDecorator
  def attachments_data
    attachment_types.index_with do |t|
      send("#{t}_formatted")
    end.compact_blank.presence
  end

  def attachments_minimal_data
    attachment_types.to_h do |t|
      ["with_#{t}", send(t).present?]
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

  def videos_formatted
    videos.map do |v|
      video_data_formatted(v)
    end
  end

  def video_data_formatted(video)
    Muffon::Sendable::Video.call(
      video:
    )
  end

  def video_channels_formatted
    video_channels.map do |c|
      video_channel_data_formatted(c)
    end
  end

  def video_channel_data_formatted(channel)
    Muffon::Sendable::VideoChannel.call(
      channel:
    )
  end

  def video_playlists_formatted
    video_playlists.map do |p|
      video_playlist_data_formatted(p)
    end
  end

  def video_playlist_data_formatted(playlist)
    Muffon::Sendable::VideoPlaylist.call(
      playlist:
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

  def communities_formatted
    communities.map do |c|
      community_data_formatted(c)
    end
  end

  def community_data_formatted(community)
    Muffon::Sendable::Community.call(
      community:
    )
  end
end
