module Muffon
  module Formatter
    module Source
      module Video
        class Links < Muffon::Formatter::Source::Video::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              video_record
            ]
          end

          def data
            { links: source_data[:links] }
          end
        end
      end
    end
  end
end
