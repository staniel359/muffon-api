module Muffon
  module Utils
    module Library
      module Artist
        include Muffon::Utils::Artist

        private

        def library_artist_data
          { id: library_artist.id }
        end

        def name
          artist.name
        end

        def artist
          @artist ||= library_artist.artist
        end

        def albums_count
          library_artist
            .library_albums_count
        end

        def tracks_count
          library_artist
            .library_tracks_count
        end

        def created_formatted
          datetime_formatted(
            created_conditional
          )
        end

        def created_conditional
          first_library_track&.created_at ||
            library_artist.created_at
        end

        def first_library_track
          library_artist
            .library_tracks
            .created_asc_ordered
            .first
        end
      end
    end
  end
end
