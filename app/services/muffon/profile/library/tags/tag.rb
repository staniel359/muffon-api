module Muffon
  module Profile
    module Library
      class Tags
        class Tag < Muffon::Profile::Library::Tags
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              tag
            ]
          end

          def data
            {
              library: library_tag_data,
              name: tag.name,
              count: tag.library_count
            }
          end

          def library_tag_data
            { id: tag.id }
          end

          def tag
            @args[:tag]
          end
        end
      end
    end
  end
end
