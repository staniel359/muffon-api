module VK
  module Search
    class Tracks < VK::Search::Base
      private

      def collection_name
        'tracks'
      end

      def collection_data
        tracks_list.map { |t| track_data(t) }
      end

      def tracks_list
        results.dig('playlist', 'list')
      end

      def track_data(track)
        {
          title: track_title(track),
          artist: track_artist_name(track),
          length: track[5],
          audio: audio_data(track)
        }
      end

      def audio_data(track)
        {
          present: audio_id(track).present?,
          id: audio_id(track),
          source: 'vk'
        }
      end
    end
  end
end
