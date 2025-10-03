module AmazonMusic
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track.dig(
          'primaryText', 'text'
        )
      end

      def raw_artists
        [artist_data]
      end

      def artist_data
        {
          'name' => artist_name,
          'id' => artist_amazonmusic_id
        }
      end

      def artist_name
        track['secondaryText']
      end

      def artist_amazonmusic_id
        artist_amazonmusic_slug.match(
          %r{artists/(.+)/}
        )[1]
      end

      def artist_amazonmusic_slug
        track.dig(
          'secondaryLink', 'deeplink'
        )
      end

      def source_data
        {
          name: source_name,
          id: amazonmusic_id,
          album_id: album_amazonmusic_id,
          links: source_links_data
        }
      end

      def amazonmusic_id
        amazonmusic_slug.match(
          /trackAsin=(.+)/
        )[1]
      end

      def amazonmusic_slug
        track.dig(
          'primaryLink', 'deeplink'
        )
      end

      def original_link
        "https://music.amazon.com#{amazonmusic_slug}"
      end

      def streaming_link
        streaming_link_formatted(
          model: 'track',
          model_id: amazonmusic_id
        )
      end

      def album_data
        return if album_title.blank?

        {
          source: album_source_data,
          title: album_title
        }
      end

      def album_title
        track.dig(
          'contextMenu', 'options', 0,
          'onItemSelected', 1, 'template',
          'headerText', 'text'
        )
      end

      def album_source_data
        {
          name: source_name,
          id: album_amazonmusic_id
        }
      end

      def album_amazonmusic_id
        amazonmusic_slug.match(
          %r{albums/(.+)\?}
        )[1]
      end

      def image_data
        image_data_formatted(
          image_link
        )
      end

      def image_link
        track['image']
      end

      def audio_present?
        true
      end

      def duration
        duration_string_to_seconds(
          raw_duration
        )
      end

      def raw_duration
        track['secondaryText3']
      end
    end
  end
end
