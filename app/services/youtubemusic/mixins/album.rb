module YouTubeMusic
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection

      private

      def title
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
        raw_raw_artists.map do |raw_artist_data|
          {
            name: raw_artist_data['text'],
            source_id: raw_artist_data.dig(
              'navigationEndpoint',
              'browseEndpoint',
              'browseId'
            )
          }
        end
      end

      def raw_raw_artists
        find_raw_artists_data(
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
        )
      end

      def youtube_id
        find_youtube_id(
          raw_album_data.dig(
            'responseContext',
            'serviceTrackingParams',
            0,
            'params'
          )
        )
      end

      def source_original_link
        "https://music.youtube.com/browse/#{youtube_id}"
      end

      def image_data
        YouTube::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
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
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
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
