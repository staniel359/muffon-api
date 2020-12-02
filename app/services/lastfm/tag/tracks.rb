module LastFM
  module Tag
    class Tracks < LastFM::Tag::Base
      private

      def tracks
        tracks_list.map do |t|
          {
            id: track_id(t),
            title: title(t),
            artist: artist(t)
          }
        end
      end

      def tracks_list
        response_data.css('.chartlist-row')
      end

      def track_id(track)
        ::Track.with_artist_id_title(
          artist_id(track), title(track)
        ).id
      end

      def artist_id(track)
        ::Artist.with_name(artist(track)).id
      end

      def artist(track)
        track.css('.chartlist-artist a').text
      end

      def title(track)
        track.css('.chartlist-name a').text
      end
    end
  end
end
