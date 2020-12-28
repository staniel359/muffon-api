module LastFM
  module Tag
    class Tracks < LastFM::Tag::Base
      private

      def tracks
        tracks_list.map do |t|
          {
            id: track_id(artist_name(t), title(t)),
            title: title(t),
            artist: artist_name(t)
          }
        end
      end

      def tracks_list
        response_data.css('.chartlist-row')
      end

      def artist_name(track)
        track.css('.chartlist-artist a').text
      end

      def title(track)
        track.css('.chartlist-name a').text
      end
    end
  end
end
