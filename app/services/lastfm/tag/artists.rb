module LastFM
  module Tag
    class Artists < LastFM::Tag::Base
      private

      def artists
        artists_list.map do |a|
          {
            name: artist_name(a),
            listeners_count: listeners_count(a)
          }
        end
      end

      def artists_list
        parsed_response.css('.big-artist-list-item')
      end

      def artist_name(artist)
        artist.css('.big-artist-list-title').text
      end

      def listeners_count(artist)
        artist.css(
          '.big-artist-list-listeners'
        ).text.scan(/\d/).join.to_i
      end
    end
  end
end
