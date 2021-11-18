module Muffon
  module Updater
    module Artist
      class ListenersCount < Muffon::Updater::Artist::Base
        private

        def update_artist
          find_artist.update(
            listeners_count: listeners_count
          )
        end

        def listeners_count
          artist[:listeners_count]
        end
      end
    end
  end
end
