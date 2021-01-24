module Spotify
  module Search
    class Tracks < Spotify::Search::Base
      private

      def collection_name
        'tracks'
      end

      def collection_type
        'track'
      end

      def collection_item_data(track)
        {
          title: track['name'],
          artist: artist_data(track),
          album: album_data(track),
          length: length(track),
          audio: audio_data(track)
        }
      end

      def album_data(track)
        { title: track.dig('album', 'name') }
      end
    end
  end
end
