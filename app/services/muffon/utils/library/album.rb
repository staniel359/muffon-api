module Muffon
  module Utils
    module Library
      module Album
        include Muffon::Utils::Album

        private

        def album_id
          album.id
        end

        def album
          @album ||= library_album.album
        end

        def artist_data
          {
            id: library_artist.id,
            name: artist.name
          }
        end

        def library_artist
          @library_artist ||=
            library_album.library_artist
        end

        def artist
          @artist ||= library_artist.artist
        end
      end
    end
  end
end
