module Muffon
  module Formatter
    module Source
      module Label
        class Base < Muffon::Formatter::Base
          private

          def source_data
            {
              name: source_name,
              id: source_label_id,
              links: source_links_data
            }
          end

          def source_name
            @args[:source_name]
          end

          def source_label_id
            @args[:source_label_id]
          end

          def source_streaming_link
            nil
          end

          def name
            @args[:name]
          end

          def image_data
            @args[:image_data]
          end
        end
      end
    end
  end
end
