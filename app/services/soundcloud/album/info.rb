module SoundCloud
  module Album
    class Info < SoundCloud::Album::Base
      private

      def album_data
        {
          title: response_data['title'],
          artist: response_data.dig('user', 'username'),
          images: images(response_data),
          released: released,
          description: description_truncated,
          tags: tags.first(5),
          tracks: tracks
        }
      end

      def released
        time_formatted(
          response_data.values_at(
            'release_year', 'release_month', 'release_day'
          ).compact.join('-')
        )
      end

      def tags
        [response_data['genre'], tags_list].flatten.reject(&:blank?)
      end

      def tags_list
        response_data['tags'].split(/\s?"\s?/)
      end

      def tracks
        response_data['tracks'].map do |t|
          {
            id: track_id(artist_name(t), track_title(t)),
            title: track_title(t),
            artist: artist_name(t),
            length: t['duration'] / 1_000,
            audio: audio_data(t)
          }
        end
      end

      def artist_name(track)
        track.dig('user', 'username')
      end

      def track_title(track)
        track['title']
      end

      def audio_data(track)
        {
          present: track['id'].present?,
          id: track['id'],
          source: 'soundcloud'
        }
      end
    end
  end
end
