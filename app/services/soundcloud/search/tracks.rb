module SoundCloud
  module Search
    class Tracks < SoundCloud::Search::Base
      private

      def soundcloud_collection_name
        'tracks'
      end

      def collection_name
        'tracks'
      end

      def total_limit
        (@args.limit || 50).to_i
      end

      def collection_list
        response_data
      end

      def collection_item_data(track)
        {
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
