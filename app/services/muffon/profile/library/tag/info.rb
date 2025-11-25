module Muffon
  module Profile
    module Library
      module Tag
        class Info < Muffon::Profile::Library::Tag::Base
          private

          def tag_data
            {
              **super,
              artists_count:
            }
          end

          def artists_count
            tag_library_artists.count
          end
        end
      end
    end
  end
end
