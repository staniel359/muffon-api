module Muffon
  module Updater
    module Album
      class ListenersCount < Muffon::Updater::Album::Base
        private

        def update_album
          find_album.update(
            listeners_count: listeners_count
          )
        end

        def listeners_count
          album[:listeners_count]
        end
      end
    end
  end
end
