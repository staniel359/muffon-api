module Muffon
  module Processor
    module Artist
      module ListenersCount
        class Updater < Muffon::Processor::Artist::Base
          private

          def data
            find_artist.update(
              listeners_count:
                @args[:listeners_count]
            )
          end
        end
      end
    end
  end
end
