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
          @album ||= profile_album.album
        end

        def artist_data
          {
            id: profile_artist.id,
            name: artist.name
          }
        end

        def profile_artist
          @profile_artist ||=
            profile_album.profile_artist
        end

        def artist
          @artist ||= profile_artist.artist
        end
      end
    end
  end
end
