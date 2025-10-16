module YouTubeMusic
  module Search
    class Videos
      class Video < YouTubeMusic::Search::Videos
        include YouTubeMusic::Utils::Video

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            video
          ]
        end

        def data
          {
            **self_data,
            source: source_data,
            title:,
            channel: channel_data,
            image: image_data,
            duration:,
            views_count:
          }.compact
        end

        def video
          @args[:video]
        end

        def duration
          duration_string_to_seconds(
            raw_duration
          )
        end

        def views_count
          human_number_to_number(
            raw_views_count
          )
        end
      end
    end
  end
end
