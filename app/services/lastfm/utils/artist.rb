module LastFM
  module Utils
    module Artist
      private

      def name
        artist['name']
      end

      def image_data
        ::Artist.with_name(name).image
      end

      def listeners_count
        ::Artist.with_name(
          name
        ).listeners_count
      end
    end
  end
end
