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
          @artist ||= profile_artist.artist
        end
      end
    end
  end
end
