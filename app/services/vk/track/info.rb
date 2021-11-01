module VK
  module Track
    class Info < VK::Track::Base
      private

      def track_data
        track_base_data
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          id: id,
          player_id: player_id,
          title: title,
          extra_title: extra_title,
          artist: artist_formatted,
          artists: artists
        }.compact
      end

      def track_extra_data
        {
          album: album_formatted,
          albums: albums,
          image: image_data,
          duration: duration,
          duration_seconds: duration_seconds,
          audio: audio_data
        }
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link,
          source_id: SOURCE_ID
        }
      end

      def audio_link
        @audio_link ||= VK::Utils::Audio::File.call(
          track_id: @args.track_id,
          link: raw_audio_link
        )
      end

      def raw_audio_link
        VK::Track::AudioLink.call(
          track_id: @args.track_id
        )
      end
    end
  end
end
