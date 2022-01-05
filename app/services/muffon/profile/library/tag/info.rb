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
                profile_artists.count
            }
          end
        end
      end
    end
  end
end
