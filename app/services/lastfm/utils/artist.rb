module LastFM
  module Utils
    module Artist
      DEFAULT_IMAGE_ID =
        '2a96cbd8b46e442fc41c2b86b821562f'.freeze

      include Muffon::Utils::Artist

      private

      def name
        artist['name']
      end

      def source_data
        {
          name: source_name,
          links: source_links_data
        }
      end

      def original_link
        "https://www.last.fm/music/#{original_link_name}"
      end

      def original_link_name
        CGI.escape(
          name
        )
      end

      def image_data
        image_data_formatted(
          image
        ) || super
      end

      def image
        nil
      end
    end
  end
end
