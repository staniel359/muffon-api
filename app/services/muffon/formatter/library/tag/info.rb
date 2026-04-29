module Muffon
  module Formatter
    module Library
      module Tag
        class Info < Muffon::Formatter::Library::Tag::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              tag_record
              artists_count
            ]
          end

          def data
            {
              library: library_tag_data,
              name: tag_record.name,
              artists_count:
            }.compact
          end
        end
      end
    end
  end
end
