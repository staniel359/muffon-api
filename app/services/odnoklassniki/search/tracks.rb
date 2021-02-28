module Odnoklassniki
  module Search
    class Tracks < Odnoklassniki::Search::Base
      private

      def collection_name
        'tracks'
      end

      def collection_list_item(track)
        {
          title: track['name'],
          artist: artist_data(track),
          album: album_data(track),
          length: track['duration'],
          audio: audio_data(track)
        }
      end

      def album_data(track)
        return {} if track['albumId'].negative?

        { id: track['albumId'] }
      end
    end
  end
end
