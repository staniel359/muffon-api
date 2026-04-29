module Muffon
  module Formatter
    module Source
      module Label
        class Info < Muffon::Formatter::Source::Label::Base
          DESCRIPTION_SIZE = 'medium'.freeze

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              source_original_link
              source_name
              source_label_id
              name
              image_data
              description
            ]
          end

          def data
            {
              source: source_data,
              name:,
              image: image_data,
              description: description_computed,
              **with_more_data
            }.compact
          end
        end
      end
    end
  end
end
