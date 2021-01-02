module SoundCloud
  module Album
    class Info < SoundCloud::Base
      private

      def primary_args
        [@args.album_id]
      end

      def link
        "#{base_link}/playlists/#{@args.album_id}"
      end

      def data
        { album: album_data }
      end

      def album_data
        {
          title: response_data['title'],
          artist: response_data.dig('user', 'username'),
          images: images(response_data),
          released: released,
          description: response_data['description'].to_s,
          tags: tags,
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
        [response_data['genre'], tags_list].flatten
      end

      def tags_list
        response_data['tags'].split(/\s?"\s?/).reject(&:blank?)
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
