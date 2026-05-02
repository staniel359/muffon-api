module Muffon
  module Formatter
    module Source
      module VideoChannel
        class Playlists < Muffon::Formatter::Source::VideoChannel::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              video_channel_record
              prev_page
              next_page
              playlists
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              title:,
              prev_page:,
              next_page:,
              playlists:,
              **with_more_data
            }.compact
          end
        end
      end
    end
  end
end
