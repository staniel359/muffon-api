module Muffon
  module Utils
    module Sendable
      class Attachments
        class VideoChannel < Muffon::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              raw_video_channel_data
            ]
          end

          def data
            Muffon::Formatter::Sendable::Attachments::VideoChannel.call(
              video_channel_record:
            )
          end

          def video_channel_record
            ::VideoChannel.find_by(
              youtube_id:
            )
          end

          def youtube_id
            @args[:raw_video_channel_data]['youtube_id']
          end
        end
      end
    end
  end
end
