module Muffon
  module Profile
    class Playlists
      class Playlist < Muffon::Profile::Base
        def call
          data
        end

        private

        def data
          {
            id: playlist.id,
            playlist_track_id: playlist_track&.id,
            title: playlist.title,
            image: playlist.image_data,
            tracks_count: playlist.playlist_tracks_count,
            created: created_formatted
          }.compact
        end

        def playlist
          @args[:playlist]
        end

        def playlist_track
          return if @args[:track_id].blank?

          playlist.playlist_tracks.find_by(
            track_id: @args[:track_id]
          )
        end

        def created_formatted
          datetime_formatted(
            playlist.created_at
          )
        end
      end
    end
  end
end
