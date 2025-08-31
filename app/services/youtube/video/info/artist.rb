module YouTube
  module Video
    class Info
      class Artist < YouTube::Video::Info
        include Muffon::Utils::Artist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            channel_title
          ]
        end

        def data
          return if name.blank?

          self_data
            .merge(artist_data)
        end

        def name
          channel_title.match(
            /(.+) - Topic/
          ).try(
            :[], 1
          )
        end

        def channel_title
          @args[:channel_title]
        end

        def artist_data
          {
            name:,
            image: image_data,
            listeners_count:
          }.compact
        end
      end
    end
  end
end
