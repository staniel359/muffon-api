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
            { id: }
          end

          def id
            tag[0]
          end

          def tag
            @args[:tag]
          end

          def name
            find_tag&.name || ''
          end

          def find_tag
            ::Tag.find_by(id:)
          end

          def count
            tag[1]
          end
        end
      end
    end
  end
end
