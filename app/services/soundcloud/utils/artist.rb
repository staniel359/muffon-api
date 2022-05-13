module SoundCloud
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['username']
      end

      def source_data
        {
          name: source_name,
          id: artist['id']
        }
      end

      def image_data
        image_data_formatted(
          artist['avatar_url']
        )
      end
    end
  end
end
