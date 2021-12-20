module Muffon
  module Utils
    module Library
      module Track
        include Muffon::Utils::Track

        private

        def track_id
          track.id
        end

        def track
          @track ||= profile_track.track
        end

        def artist_data
          {
            id: profile_artist.id,
            name: artist.name
          }
        end

        def profile_artist
          @profile_artist ||=
            profile_track.profile_artist
        end

        def artist
          @artist ||= profile_artist.artist
        end

        def album_data
          return if profile_album.blank?

          {
            id: profile_album.id,
            title: album.title
          }
        end

        def profile_album
          @profile_album ||=
            profile_track.profile_album
        end

        def album
          @album ||= profile_album.album
        end

        def created_formatted
          datetime_formatted(
            profile_track.created_at
          )
        end
      end
    end
  end
end
