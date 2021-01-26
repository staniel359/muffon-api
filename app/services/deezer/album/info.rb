module Deezer
  module Album
    class Info < Deezer::Album::Base
      private

      def album_data
        album_main_data.merge(album_extra_data)
      end

      def album_main_data
        {
          title: response_data['title'],
          artist: album_artist_data,
          source: 'deezer'
        }
      end

      def album_artist_data
        { name: response_data.dig('artist', 'name') }
      end

      def album_extra_data
        {
          images: images_data(response_data, 'album'),
          listeners_count: response_data['fans'],
          released: released,
          labels: [response_data['label']],
          tags: tags,
          tracks: tracks_data
        }
      end

      def released
        time_formatted(response_data['release_date'])
      end

      def tags
        tags_list.map { |g| g['name'] }
      end

      def tags_list
        response_data.dig('genres', 'data').first(5)
      end

      def tracks_data
        tracks_list.map { |t| track_data(t) }
      end

      def tracks_list
        response_data.dig('tracks', 'data')
      end

      def track_data(track)
        {
          id: track_id(track.dig('artist', 'name'), track['title']),
          title: track['title'],
          artist: track_artist_data(track),
          length: track['duration'],
          audio: audio_data(track)
        }
      end

      def track_artist_data(track)
        { name: track.dig('artist', 'name') }
      end

      def audio_data(track)
        {
          present: track['id'].present?,
          id: track['id'],
          source: 'deezer'
        }
      end
    end
  end
end
