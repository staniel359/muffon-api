module LastFM
  module Tag
    class Artists < LastFM::Tag::Base
      private

      def artists
        artists_list.map do |a|
          {
            name: artist_name(a),
            image: image(a),
            listeners_count: listeners_count(a)
          }
        end
      end

      def artists_list
        response_data.css('.big-artist-list-item')
      end

      def artist_name(artist)
        artist.css('.big-artist-list-title').text
      end

      def listeners_count(artist)
        artist.css(
          '.big-artist-list-listeners'
        ).text.scan(/\d/).join.to_i
      end

      def image(artist)
        artist.css(
          '.big-artist-list-avatar-desktop img'
        )[0]['src'].sub('/270x205', '/174s')
      end
    end
  end
end
