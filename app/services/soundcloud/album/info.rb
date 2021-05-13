module SoundCloud
  module Album
    class Info < SoundCloud::Album::Base
      private

      def album_data
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          id: album_id(artist_name(response_data), title),
          title: title,
          artist: artist_data(response_data),
          source: 'soundcloud'
        }
      end

      def album_extra_data
        {
          image: image_data(response_data, 'album'),
          released: date_formatted(released),
          description: description_truncated,
          tags: tags.first(5),
          tracks: tracks_data
        }
      end

      def released
        response_data.values_at(
          'release_year', 'release_month', 'release_day'
        )
      end

      def tracks_data
        tracks_list.map { |t| track_data(t) }
      end

      def tracks_list
        response_data['tracks']
      end

      def track_data(track)
        {
          id: track_id(artist_name(track), track['title']),
          title: track['title'],
          artist: artist_data(track),
          length: length(track),
          audio: audio_data(track)
        }
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
