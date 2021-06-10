module Muffon
  module Updater
    module Album
      class ListenersCount < Muffon::Updater::Album::Base
        private

        def update_album
          album.update(
            listeners_count: listeners_count
          )
        end

        def listeners_count
          @args.album[:listeners_count]
        end
      end
    end
  end
end