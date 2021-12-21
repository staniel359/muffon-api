module VK
  module Artist
    class Base < VK::Base
      private

      def primary_args
        [@args[:artist_id]]
      end

      def params
        super.merge(
          artist_params
        )
      end

      def vk_artist_id
        @args[:artist_id]
      end

      def data
        { artist: artist_data }
      end
    end
  end
end
