module LastFM
  module Tag
    class Tracks < LastFM::Tag::Web::Base
      private

      def collection_name
        'tracks'
      end

      def tracks
        tracks_list.map { |t| track_data(t) }
      end

      def tracks_list
        response_data.css('.chartlist-row')
      end

      def track_data(track)
        {
          id: track_id(artist_name(track), title(track)),
          title: title(track),
          artist: track_artist_data(track)
        }
      end

      def artist_name(track)
        track.css('.chartlist-artist a').text
      end

      def title(track)
        track.css('.chartlist-name a').text
      end

      def track_artist_data(track)
        { name: artist_name(track) }
      end
    end
  end
end
