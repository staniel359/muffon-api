module LastFM
  module Utils
    module Artist
      private

      def name
        artist['name']
      end

      def image_data
        artist_image_data_formatted(name)
      end

      def listeners_count
        artist['listeners'].to_i
      end
    end
  end
end
