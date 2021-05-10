module YandexMusic
  module Search
    class Tracks < YandexMusic::Search::Base
      private

      def collection_name
        'tracks'
      end

      def collection_item_data(track)
        {
          title: full_title(track),
          artist: artist_data(track),
          album: album_data(track),
          image: image_data(track, 'track'),
          length: length(track),
          audio: audio_data(track)
        }
      end

      def artist_data(track)
        { name: artist_name(track) }
      end

      def album_data(track)
        { title: track.dig('albums', 0, 'title') }
      end

      def audio_data(track)
        {
          present: track['id'].present?,
          id: track['id'],
          source: 'yandexmusic'
        }
      end
    end
  end
end
