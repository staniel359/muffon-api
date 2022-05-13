module RateYourMusic
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album.css(
          '.searchpage'
        )[0].text
      end

      def artist_name
        artist_names
      end

      def rateyourmusic_slug
        album.css(
          '.searchpage'
        )[0]['href']
      end

      def artist_rateyourmusic_id(artist)
        artist['title'].scan(
          /\d/
        ).join.to_i
      end

      def image_data
        image_data_formatted(
          image
        )
      end

      def image
        raw_image.try(
          :[], 'data-src'
        )
      end

      def raw_image
        album.css(
          '.page_search_img'
        )[0]
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end
    end
  end
end
