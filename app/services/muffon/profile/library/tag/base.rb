module Muffon
  module Profile
    module Library
      module Tag
        class Base < Muffon::Profile::Library::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:tag_id]
            ]
          end

          def no_data?
            super || tag.blank?
          end

          def tag
            @tag ||= ::Tag.find_by(
              id: @args[:tag_id]
            )
          end

          def library_data
            { tag: tag_data }
          end

          def tag_library_artists
            @tag_library_artists ||=
              library_artists
              .left_joins(:artist)
              .where(
                '? = ANY(artists.tag_ids)',
                @args[:tag_id]
              )
          end

          def library_tag_data
            { id: tag.id }
          end
        end
      end
    end
  end
end
