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
      end
    end
  end
end
