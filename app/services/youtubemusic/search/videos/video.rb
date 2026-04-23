module YouTubeMusic
  module Search
    class Videos
      class Video < YouTubeMusic::Search::Videos
        include YouTubeMusic::Mixins::Video

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
          Muffon::Formatter::Search::Videos::Video.call(
            source_original_link:,
            source_name:,
            source_video_id: youtube_id,
            title:,
            channel_title:,
            source_video_channel_id: channel_youtube_id,
            image_data:,
            duration:,
            views_count:,
            creation_date: nil,
            **self_args
          )
        end

        def raw_video_data
          @args[:raw_video_data]
        end
      end
    end
  end
end
