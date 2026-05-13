module YouTubeMusic
  module Search
    class Videos
      class Video < YouTubeMusic::Base
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
          return if youtube_id.blank?

          update_video_record!

          Muffon::Formatter::Source::Search::Videos::Video.call(
            source_name:,
            video_record:,
            duration:,
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
