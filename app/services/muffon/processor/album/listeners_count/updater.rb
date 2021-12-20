module Muffon
  module Processor
    module Album
      module ListenersCount
        class Updater < Muffon::Processor::Album::Base
          private

          def data
            find_album.update(
              listeners_count:
                @args[:listeners_count]
            )
          end
        end
      end
    end
  end
end
