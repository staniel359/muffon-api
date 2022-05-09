module SoundCloud
  module Track
    class Info < SoundCloud::Track::Base
      private

      def track_data
        muffon_data
          .merge(track_base_data)
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          source_id:,
          player_id:,
          soundcloud_id:,
          title:,
          artist: artist_names_data,
          artists:
        }
      end

      def track_extra_data
        {
          image: image_data,
          duration:,
          duration_seconds:,
          description:
            description_truncated,
          tags: tags_truncated,
          audio: audio_data
        }.compact
      end

      def description
        track['description']
      end

      def tags_list
        [
          track['genre'].presence
        ].compact
      end

      def audio_data
        {
          source_id:,
          present: audio_link.present?,
          link: audio_link
        }
      end

      def audio_link
        return unless audio_present?

        @audio_link ||=
          streams_response_data[
            'http_mp3_128_url'
          ]
      rescue RestClient::Forbidden
        nil
      end

      def streams_response_data
        JSON.parse(
          streams_response
        )
      end

      def streams_response
        RestClient.get(
          streams_link, headers
        )
      end

      def streams_link
        "#{link}/streams"
      end
    end
  end
end
