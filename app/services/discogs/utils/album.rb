module Discogs
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['title']
      end

      def discogs_id
        album['id']
      end

      def image_data
        image_data_formatted(
          image, 'album'
        )
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        album['year'].to_s
      end
    end
  end
end
