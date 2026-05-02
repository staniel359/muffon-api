module Muffon
  module Formatter
    module Source
      module VideoChannel
        class Links < Muffon::Formatter::Source::VideoChannel::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              video_channel_record
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
