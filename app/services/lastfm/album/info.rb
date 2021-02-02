module LastFM
  module Album
    class Info < LastFM::Album::Base
      private

      def album_data
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          id: album_id(artist_name, title),
          title: title,
          artist: artist_data,
          source: 'lastfm'
        }
      end

      def album_extra_data
        {
          images: images_data(response_data, 'album'),
          listeners_count: listeners_count,
          plays_count: plays_count,
          description: description_truncated,
          tags: tags,
          tracks: tracks_data
        }
      end

      def plays_count
        response_data['playcount'].to_i
      end

      def tags
        tags_list.map { |t| t['name'] }
      end

      def tags_list
        response_data.dig('tags', 'tag')
      end

      def tracks_data
        tracks_list.map { |t| track_data(t) }
      end

      def tracks_list
        response_data.dig('tracks', 'track')
      end

      def track_data(track)
        {
          id: track_id(track_artist_name(track), track['name']),
          title: track['name'],
          artist: track_artist_data(track),
          length: track['duration'].to_i
        }
      end

      def track_artist_name(track)
        track.dig('artist', 'name')
      end

      def track_artist_data(track)
        { name: track_artist_name(track) }
      end
    end
  end
end
