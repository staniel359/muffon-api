module LastFM
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['name']
      end

      def source_data
        {
          name: source_name,
          links: source_links
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
    end
  end
end
