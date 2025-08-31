module Muffon
  module Profile
    module Library
      module Tag
        class Base < Muffon::Profile::Library::Base
          private

          def required_args
            super + %i[
              tag_id
            ]
          end

          def not_found?
            super ||
              tag.blank?
          end

          def tag
            if instance_variable_defined?(
              :@tag
            )
              @tag
            else
              @tag =
                ::Tag.find_by(
                  id: @args[:tag_id]
                )
            end
          end

          def library_data
            { tag: tag_data }
          end

          def tag_base_data
            {
              library: library_tag_data,
              name: tag.name
            }
          end

          def library_tag_data
            { id: tag.id }
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
        end
      end
    end
  end
end
