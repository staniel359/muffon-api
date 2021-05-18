module SoundCloud
  module Track
    class Info < SoundCloud::Track::Base
      private

      def track_data
        track_base_data
          .merge(track_extra_data)
          .merge(with_more_data)
      end

      def track_base_data
        {
          id: track_id(artist_name(response_data), title),
          title: title,
          artist: artist_data(response_data)
        }
      end

      def track_extra_data
        {
          image: image_data(response_data, 'track'),
          plays_count: response_data['playback_count'],
          length: length(response_data),
          description: description_truncated,
          tags: tags,
          audio: audio_data
        }
      end

      def tags_list
        [response_data['genre']].compact
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link,
          source: 'soundcloud'
        }
      end

      def audio_link
        "#{link}/stream?client_id=#{client_id}"
      end
    end
  end
end
