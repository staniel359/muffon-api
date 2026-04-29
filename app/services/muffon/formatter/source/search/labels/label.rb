module Muffon
  module Formatter
    module Source
      module Search
        module Labels
          class Label < Muffon::Formatter::Source::Label::Base
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
              ]
            end

            def data
              {
                source: source_data,
                name:,
                image: image_data
              }.compact
            end
          end
        end
      end
    end
  end
end
