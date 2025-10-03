module LastFM
  module Utils
    module Track
      DEFAULT_IMAGE_ID =
        '4128a6eb29f94943c9d206c08e625904'.freeze

      include Muffon::Utils::Track

      private

      def title
        track['name']
      end

      def artist_name
        artist['name']
      end

      def artist
        track['artist']
      end

      def source_data
        {
          name: source_name,
          links: source_links_data
        }
      end

      def original_link
        "https://www.last.fm/music/#{original_link_artist_name}/_/#{original_link_title}"
      end

      def original_link_artist_name
        CGI.escape(
          artist_name
        )
      end

      def original_link_title
        CGI.escape(
          title
        )
      end

      def duration
        track['duration'].to_i
      end

      def listeners_count
        track['listeners'].to_i
      end
    end
  end
end
