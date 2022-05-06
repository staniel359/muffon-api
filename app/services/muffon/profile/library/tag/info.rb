module Muffon
  module Profile
    module Library
      module Tag
        class Info < Muffon::Profile::Library::Tag::Base
          private

          def tag_data
            {
              id: tag.id,
              name: tag.name,
              artists_count:
                tag_library_artists.size
            }
          end
        end
      end
    end
  end
end
