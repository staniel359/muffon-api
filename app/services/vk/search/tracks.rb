module VK
  module Search
    class Tracks < VK::Search::Base
      private

      def search_data
        { tracks: tracks }
      end

      def tracks
        tracks_list.map do |t|
          {
            title: CGI.unescapeHTML(t[3]),
            artist: CGI.unescapeHTML(t[4]),
            length: t[5],
            audio_id: audio_id(t)
          }
        end
      end

      def tracks_list
        playlists.last['list']
      end
    end
  end
end
