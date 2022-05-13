module Spotify
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['name']
      end

      def artists_list
        album['artists']
      end

      def source_data
        {
          name: source_name,
          id: album['id']
        }
      end

      def image_data
        image_data_formatted(
          album['images']
        )
      end

      def release_date
        date_formatted(
          album['release_date']
        )
      end
    end
  end
end
