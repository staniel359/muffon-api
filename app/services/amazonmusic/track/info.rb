module AmazonMusic
  module Track
    class Info < AmazonMusic::Track::Base
      private

      def track_data
        self_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          source: source_data,
          player_id: player_source_id,
          title:,
          artist: artists_base_data,
          artists:
        }
      end

      def artist_name
        track.dig(
          'contextMenu', 'options', 0,
          'onItemSelected', 1, 'template',
          'headerPrimaryText'
        )
      end

      def title
        track['primaryText']
      end

      def artist_amazonmusic_slug
        track.dig(
          'contextMenu', 'options', 1,
          'onItemSelected', 2, 'template',
          'templateData', 'deeplink'
        )
      end

      def track_extra_data
        {
          album: album_data,
          image: image_data,
          profiles_count:,
          duration:,
          audio: audio_base_data
        }.compact
      end

      def image_link
        album['headerImage']
      end

      def audio_link
        AmazonMusic::Utils::Audio::Link.call(
          track_id: @args[:track_id]
        )
      end
    end
  end
end
