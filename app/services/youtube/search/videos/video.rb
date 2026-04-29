module YouTube
  module Search
    class Videos
      class Video < YouTube::Search::Base
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
          update_record_data!

          Muffon::Formatter::Source::Search::Videos::Video.call(
            source_original_link:,
            source_name:,
            source_video_id: youtube_id,
            title:,
            channel_title:,
            source_video_channel_id: channel_youtube_id,
            image_data:,
            duration: nil,
            views_count:,
            creation_date:,
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
