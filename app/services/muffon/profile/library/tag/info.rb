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
            { artists_count: }
          end

          def artists_count
            tag_library_artists.count
          end
        end
      end
    end
  end
end
