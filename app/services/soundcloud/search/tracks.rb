module SoundCloud
  module Search
    class Tracks < SoundCloud::Search::Base
      private

      def link
        "#{search_link}/tracks"
      end

      def limit
        (@args.limit || 50).to_i
      end

      def search_data
        { tracks: tracks_data }
      end

      def tracks_data
        response_data['collection'].map do |t|
          {
            title: t['title'],
            artist: t.dig('user', 'username'),
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
