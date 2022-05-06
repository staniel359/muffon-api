module Muffon
  module Utils
    module Library
      module Artist
        include Muffon::Utils::Artist

        private

        def artist_id
          artist.id
        end

        def artist
          @artist ||= library_artist.artist
        end
      end
    end
  end
end
