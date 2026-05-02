module YouTube
  module Search
    class Videos
      class Video < YouTube::Base
        include YouTube::Mixins::Video

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
          update_video_record!

          Muffon::Formatter::Source::Search::Videos::Video.call(
            video_record:,
            **self_args
          )
        end

        def raw_video_data
          @args[:raw_video_data]
        end

        def youtube_id
          raw_video_data.dig(
            'id',
            'videoId'
          )
        end
      end
    end
  end
end
