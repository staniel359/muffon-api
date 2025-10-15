module YouTubeMusic
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        raw_album_data.dig(
          'musicResponsiveListItemRenderer',
          'flexColumns',
          0,
          'musicResponsiveListItemFlexColumnRenderer',
          'text',
          'runs',
          0,
          'text'
        ) ||
          raw_album_data.dig(
            'contents',
            'twoColumnBrowseResultsRenderer',
            'tabs',
            0,
            'tabRenderer',
            'content',
            'sectionListRenderer',
            'contents',
            0,
            'musicResponsiveHeaderRenderer',
            'title',
            'runs',
            0,
            'text'
          )
      end

      def raw_artists
        @raw_artists ||=
          find_raw_artists_data(
            raw_album_data.dig(
              'musicResponsiveListItemRenderer',
              'flexColumns',
              1,
              'musicResponsiveListItemFlexColumnRenderer',
              'text',
              'runs'
            ) ||
            raw_album_data.dig(
              'contents',
              'twoColumnBrowseResultsRenderer',
              'tabs',
              0,
              'tabRenderer',
              'content',
              'sectionListRenderer',
              'contents',
              0,
              'musicResponsiveHeaderRenderer',
              'straplineTextOne',
              'runs'
            )
          ).presence ||
          [
            raw_album_data.dig(
              'musicResponsiveListItemRenderer',
              'flexColumns',
              1,
              'musicResponsiveListItemFlexColumnRenderer',
              'text',
              'runs',
              2
            )
          ].compact.presence ||
          raw_album_data.dig(
            'contents',
            'twoColumnBrowseResultsRenderer',
            'tabs',
            0,
            'tabRenderer',
            'content',
            'sectionListRenderer',
            'contents',
            0,
            'musicResponsiveHeaderRenderer',
            'straplineTextOne',
            'runs'
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
        raw_album_data.dig(
          'musicResponsiveListItemRenderer',
          'navigationEndpoint',
          'browseEndpoint',
          'browseId'
        ) ||
          find_youtube_id(
            raw_album_data.dig(
              'responseContext',
              'serviceTrackingParams',
              0,
              'params'
            )
          )
      end

      def original_link
        "https://music.youtube.com/browse/#{youtube_id}"
      end

      def image_data
        image_data_formatted(
          image_link
        )
      end

      def image_link
        raw_album_data.dig(
          'musicResponsiveListItemRenderer',
          'thumbnail',
          'musicThumbnailRenderer',
          'thumbnail',
          'thumbnails',
          -1,
          'url'
        ) ||
          raw_album_data.dig(
            'contents',
            'twoColumnBrowseResultsRenderer',
            'tabs',
            0,
            'tabRenderer',
            'content',
            'sectionListRenderer',
            'contents',
            0,
            'musicResponsiveHeaderRenderer',
            'thumbnail',
            'musicThumbnailRenderer',
            'thumbnail',
            'thumbnails',
            -1,
            'url'
          )
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        raw_album_data.dig(
          'musicResponsiveListItemRenderer',
          'flexColumns',
          1,
          'musicResponsiveListItemFlexColumnRenderer',
          'text',
          'runs',
          -1,
          'text'
        ) ||
          raw_album_data.dig(
            'contents',
            'twoColumnBrowseResultsRenderer',
            'tabs',
            0,
            'tabRenderer',
            'content',
            'sectionListRenderer',
            'contents',
            0,
            'musicResponsiveHeaderRenderer',
            'subtitle',
            'runs',
            -1,
            'text'
          )
      end

      def description
        raw_album_data.dig(
          'microformat',
          'microformatDataRenderer',
          'description'
        )
      end

      def raw_tracks
        raw_album_data.dig(
          'contents',
          'twoColumnBrowseResultsRenderer',
          'secondaryContents',
          'sectionListRenderer',
          'contents',
          0,
          'musicShelfRenderer',
          'contents'
        )
      end
    end
  end
end
