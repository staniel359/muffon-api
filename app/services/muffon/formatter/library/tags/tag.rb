module Muffon
  module Formatter
    module Library
      module Tags
        class Tag < Muffon::Formatter::Library::Tag::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              tag_record
            ]
          end

          def data
            {
              library: library_tag_data,
              name:,
              count: library_count
            }
          end
        end
      end
    end
  end
end
