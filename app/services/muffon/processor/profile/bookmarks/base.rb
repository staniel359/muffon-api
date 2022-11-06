module Muffon
  module Processor
    module Profile
      module Bookmarks
        class Base < Muffon::Profile::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token]
            ]
          end

          def forbidden?
            wrong_profile?
          end

          def data
            process_bookmark
          end
        end
      end
    end
  end
end
