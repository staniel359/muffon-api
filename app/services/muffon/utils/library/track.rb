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
          @track ||= library_track.track
        end

        def artist_data
          {
            id: library_artist.id,
            name: artist.name
          }
        end

        def library_artist
          @library_artist ||=
            library_track.library_artist
        end

        def artist
          @artist ||= library_artist.artist
        end

        def album_data
          return if library_album.blank?

          {
            id: library_album.id,
            title: album.title
          }
        end

        def library_album
          @library_album ||=
            library_track.library_album
        end

        def album
          @album ||= library_album.album
        end

        def created_formatted
          datetime_formatted(
            library_track.created_at
          )
        end
      end
    end
  end
end
