module AmazonMusic
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection
      include AmazonMusic::Mixins::Base

      private

      def title
        raw_album_data.dig(
          'primaryText',
          'text'
        )
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        {
          name: artist_name,
          source_id: artist_amazonmusic_id
        }
      end

      def artist_name
        raw_album_data['secondaryText']
      end

      def artist_amazonmusic_id
        artist_amazonmusic_slug.match(
          %r{artists/(.+)/}
        )[1]
      end

      def artist_amazonmusic_slug
        raw_album_data.dig(
          'secondaryLink',
          'deeplink'
        )
      end

      def amazonmusic_id
        amazonmusic_slug.match(
          %r{albums/(.+)}
        )[1]
      end

      def amazonmusic_slug
        raw_album_data.dig(
          'primaryLink',
          'deeplink'
        )
      end

      def source_original_link
        "#{WEB_BASE_URL}#{amazonmusic_slug}"
      end

      def image_data
        AmazonMusic::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_album_data['image']
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_data.dig(
          'primaryLink',
          'onItemSelected',
          1,
          'template',
          'headerTertiaryText'
        )
      end

      def raw_tracks
        raw_album_data.dig(
          'widgets',
          0,
          'items'
        )
      end
    end
  end
end
