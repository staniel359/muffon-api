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
            id: id,
            playlist_track_id: playlist_track_id,
            title: title,
            image: image_data,
            tracks_count: tracks_count,
            created: created
          }.compact
        end

        def id
          playlist.id
        end

        def playlist
          @playlist ||= @args.playlist
        end

        def playlist_track_id
          playlist_track&.id
        end

        def playlist_track
          return if @args.track_id.blank?

          playlist.playlist_tracks.find_by(
            track_id: @args.track_id
          )
        end

        def title
          playlist.title
        end

        def image_data
          playlist.image_data
        end

        def tracks_count
          playlist.playlist_tracks_count
        end

        def created
          datetime_formatted(
            playlist.created_at
          )
        end
      end
    end
  end
end
