module LastFM
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['name']
      end

      def image_data
        find_artist.image_data
      end

      def listeners_count
        find_artist.listeners_count
      end
    end
  end
end
