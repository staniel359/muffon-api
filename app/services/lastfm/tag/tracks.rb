module LastFM
  module Tag
    class Tracks < LastFM::Tag::Base
      private

      def tracks
        tracks_list.map do |t|
          {
            title: t.css('.chartlist-name a').text,
            artist: t.css('.chartlist-artist a').text
          }
        end
      end

      def tracks_list
        parsed_response.css('.chartlist-row')
      end
    end
  end
end
