module Muffon
  module Utils
    module Sendable
      class Attachments
        class Video < Muffon::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              raw_video_data
            ]
          end

          def data
            Muffon::Formatter::Sendable::Attachments::Video.call(
              video_record:
            )
          end

          def video_record
            ::Video.find_by(
              youtube_id:
            )
          end

          def youtube_id
            @args[:raw_video_data]['youtube_id']
          end
        end
      end
    end
  end
end
