module Muffon
  module Formatter
    module Source
      module Tag
        class Info < Muffon::Formatter::Source::Tag::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              name
              description
              description_size
              taggings_count
              taggers_count
            ]
          end

          def data
            {
              name:,
              description: description_computed,
              taggings_count:,
              taggers_count:,
              **with_more_data
            }.compact
          end
        end
      end
    end
  end
end
