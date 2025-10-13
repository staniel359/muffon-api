module YouTubeMusic
  module Utils
    module Video
      include Muffon::Utils::Video

      private

      def title
        video.dig(
          'musicResponsiveListItemRenderer',
          'flexColumns',
          0,
          'musicResponsiveListItemFlexColumnRenderer',
          'text',
          'runs',
          0,
          'text'
        )
      end

      def source_data
        {
          name: source_name,
          id: youtube_id,
          links: source_links_data
        }
      end

      def youtube_id
        video.dig(
          'musicResponsiveListItemRenderer',
          'flexColumns',
          0,
          'musicResponsiveListItemFlexColumnRenderer',
          'text',
          'runs',
          0,
          'navigationEndpoint',
          'watchEndpoint',
          'videoId'
        ) ||
          video.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            0,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            0,
            'navigationEndpoint',
            'browseEndpoint',
            'browseId'
          ).sub(
            'MPED',
            ''
          )
      end

      def original_link
        "https://music.youtube.com/watch?v=#{youtube_id}"
      end

      def streaming_link
        streaming_link_formatted(
          model: 'video',
          model_id: youtube_id
        )
      end

      def channel_data
        {
          source: channel_source_data,
          title: channel_title
        }
      end

      def channel_source_data
        {
          name: source_name,
          id: channel_youtube_id
        }.compact
      end

      def channel_youtube_id
        raw_channel_data.dig(
          'navigationEndpoint',
          'browseEndpoint',
          'browseId'
        )
      end

      def raw_channel_data
        @raw_channel_data ||= begin
          raw_data =
            video.dig(
              'musicResponsiveListItemRenderer',
              'flexColumns',
              1,
              'musicResponsiveListItemFlexColumnRenderer',
              'text',
              'runs'
            )

          raw_data.find do |raw_item_data|
            raw_item_data['navigationEndpoint'].present?
          end ||
            raw_data[0]
        end
      end

      def channel_title
        raw_channel_data['text']
      end

      def image_data
        image_data_formatted(
          image
        )
      end

      def image
        video.dig(
          'musicResponsiveListItemRenderer',
          'thumbnail',
          'musicThumbnailRenderer',
          'thumbnail',
          'thumbnails',
          0,
          'url'
        )
      end

      def raw_duration
        video.dig(
          'musicResponsiveListItemRenderer',
          'flexColumns',
          1,
          'musicResponsiveListItemFlexColumnRenderer',
          'text',
          'runs'
        ).find do |raw_item_data|
          raw_item_data['text'].match?(/\d+:\d+/)
        end.try(
          :[],
          'text'
        )
      end

      def raw_views_count
        raw_data =
          video.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs'
          ).find do |raw_item_data|
            raw_item_data['text'].match?(/\w+ views/)
          end ||
          video.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            2,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs'
          ).find do |raw_item_data|
            raw_item_data['text'].match?(/\w+ plays/)
          end

        raw_data.try(
          :[],
          'text'
        )&.match(/(.+) (views|plays)/).try(:[], 1)
      end
    end
  end
end
