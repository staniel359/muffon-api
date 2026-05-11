module Muffon
  module Utils
    module Sendable
      class Attachments
        class VideoPlaylist < Muffon::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              raw_video_playlist_data
            ]
          end

          def data
            Muffon::Formatter::Sendable::Attachments::VideoPlaylist.call(
              video_playlist_record:
            )
          end

          def video_playlist_record
            ::VideoPlaylist.find_by(
              youtube_id:
            )
          end

          def youtube_id
            @args[:raw_video_playlist_data]['youtube_id']
          end
        end
      end
    end
  end
end
