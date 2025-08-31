module Muffon
  module Processor
    module Profile
      module Favorites
        class Base < Muffon::Processor::Profile::Base
          private

          def data
            process_favorite
          end
        end
      end
    end
  end
end
