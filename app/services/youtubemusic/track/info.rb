module YouTubeMusic
  module Track
    class Info < YouTubeMusic::Track::Base
      private

      def track_data
        {
          **self_data,
          **track_base_data,
          album: album_data,
          image: image_data,
          plays_count:,
          profiles_count:,
          duration:,
          audio: audio_base_data
        }.compact
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
    end
  end
end
