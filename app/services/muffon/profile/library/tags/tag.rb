module Muffon
  module Profile
    module Library
      class Tags
        class Tag < Muffon::Profile::Library::Tags
          def call
            data
          end

          private

          def data
            {
              library: library_tag_data,
              name:,
              count:
            }
          end

          def library_tag_data
            { id: tag[:id] }
          end

          def tag
            @args[:tag]
          end

          def name
            tag[:name]
          end

          def count
            tag[:count]
          end
        end
      end
    end
  end
end
