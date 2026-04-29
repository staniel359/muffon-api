module Muffon
  module Profile
    module Library
      module Tag
        class Base < Muffon::Profile::Library::Base
          private

          def required_args
            [
              *super,
              :tag_id
            ]
          end

          def not_found?
            super || tag_record.blank?
          end

          def tag_record
            if defined?(@tag_record)
              @tag_record
            else
              @tag_record =
                ::Tag.find_by(
                  id: @args[:tag_id]
                )
            end
          end

          def library_data
            { tag: tag_data }
          end

          def tag_library_artists
            @tag_library_artists ||=
              library_artists
              .left_joins(:artist)
              .where(
                '? = ANY(artists.tags_ids)',
                @args[:tag_id]
              )
          end
        end
      end
    end
  end
end
