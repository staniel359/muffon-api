module YouTube
  module Search
    class Channels
      class Channel < YouTube::Search::Channels
        include YouTube::Utils::Channel

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            channel
          ]
        end

        def data
          return if snippet.blank?

          self_data
            .merge(channel_data)
        end

        def channel_data
          {
            source: source_data,
            title:,
            image: image_data,
            publish_date:
          }
        end

        def channel
          @args[:channel]
        end

        def youtube_id
          channel.dig(
            'id',
            'channelId'
          )
        end

        def views_count
          nil
        end

        def videos_count
          nil
        end

        def subscribers_count
          nil
        end
      end
    end
  end
end
