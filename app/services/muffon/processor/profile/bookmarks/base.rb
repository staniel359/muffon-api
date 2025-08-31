module Muffon
  module Processor
    module Profile
      module Bookmarks
        class Base < Muffon::Processor::Profile::Base
          private

          def data
            process_bookmark
          end
        end
      end
    end
  end
end
