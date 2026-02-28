module YouTubeMusic
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        raw_artist_data.dig(
          'musicResponsiveListItemRenderer',
          'flexColumns',
          0,
          'musicResponsiveListItemFlexColumnRenderer',
          'text',
          'runs',
          0,
          'text'
        ) ||
          raw_artist_data.dig(
            'header',
            'musicImmersiveHeaderRenderer',
            'title',
            'runs',
            0,
            'text'
          ) ||
          raw_artist_data.dig(
            'header',
            'musicHeaderRenderer',
            'title',
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
        raw_artist_data.dig(
          'musicResponsiveListItemRenderer',
          'navigationEndpoint',
          'browseEndpoint',
          'browseId'
        )
      end

      def original_link
        "https://music.youtube.com/channel/#{youtube_id}"
      end

      def image_data
        image_data_formatted(
          image_link
        )
      end

      def image_link
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
