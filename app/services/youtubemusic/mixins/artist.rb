module YouTubeMusic
  module Mixins
    module Artist
      private

      def name
        raw_artist_data.dig(
          'header',
          'musicImmersiveHeaderRenderer',
          'title',
          'runs',
          0,
          'text'
        )
      end

      def youtube_id
        raw_artist_data.dig(
          'responseContext',
          'serviceTrackingParams',
          0,
          'params',
          2,
          'value'
        )
      end

      def source_original_link
        "https://music.youtube.com/channel/#{youtube_id}"
      end

      def image_data
        YouTubeMusic::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_artist_data.dig(
          'musicResponsiveListItemRenderer',
          'thumbnail',
          'musicThumbnailRenderer',
          'thumbnail',
          'thumbnails',
          -1,
          'url'
        )
      end
    end
  end
end
