module Muffon
  module Formatter
    module Source
      module Tag
        class Info < Muffon::Formatter::Source::Tag::Base
          DESCRIPTION_SIZE = 'medium'.freeze

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              name
              description
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
