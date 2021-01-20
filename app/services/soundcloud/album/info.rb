module SoundCloud
  module Album
    class Info < SoundCloud::Album::Base
      private

      def album_data
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          title: response_data['title'],
          artist: artist_name(response_data),
          source: 'soundcloud'
        }
      end

      def artist_name(track)
        track.dig('user', 'username')
      end

      def album_extra_data
        {
          images: images(response_data, 'album'),
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

      def tracks
        response_data['tracks'].map do |t|
          {
            id: track_id(artist_name(t), t['title']),
            title: t['title'],
            artist: artist_name(t),
            length: t['duration'] / 1_000,
            audio: audio_data(t)
          }
        end
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
