module Muffon
  module Profile
    module Library
      module Tag
        class Info < Muffon::Profile::Library::Tag::Base
          private

          def tag_data
            tag_base_data
              .merge(tag_extra_data)
          end

          def tag_extra_data
            {
              artists_count:
                tag_library_artists.size
            }
          end
        end
      end
    end
  end
end
