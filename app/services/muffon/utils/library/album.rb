module Muffon
  module Utils
    module Library
      module Album
        include Muffon::Utils::Album

        private

        def library_album_data
          {
            id: library_album.id,
            artist: library_artist_data
          }
        end

        def library_artist_data
          { id: library_artist.id }
        end

        def library_artist
          library_album.library_artist
        end

        def title
          album.title
        end

        def album
          @album ||= library_album.album
        end

        def artists
          [artist_data]
        end

        def artist_data
          { name: artist_name }
        end

        def artist_name
          artist.name
        end

        def artist
          library_artist.artist
        end

        def tracks_count
          library_album.library_tracks_count
        end

        def created_formatted
          datetime_formatted(
            library_album.created_at
          )
        end

        def source_data
          library_album.source_data
        end
      end
    end
  end
end
