module Genius
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_album_data['name']
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        {
          name: raw_album_data.dig(
            'artist',
            'name'
          ),
          source_id: raw_album_data.dig(
            'artist',
            'id'
          )
        }
      end

      def genius_id
        raw_album_data['id']
      end

      def source_original_link
        raw_album_data['url']
      end

      def image_data
        Genius::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_album_data['cover_art_url']
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_release_date_items_data
          .values
          .compact
      end

      def raw_release_date_items_data
        raw_album_data['release_date_components'] || {}
      end

      def description
        raw_album_data['description_preview']
      end
    end
  end
end
