module LastFM
  module Tag
    class Albums < LastFM::Tag::Base
      private

      def albums
        albums_list.map do |a|
          {
            title: title(a),
            artist: artist(a),
            cover: cover(a),
            listeners_count: listeners_count(a)
          }
        end
      end

      def albums_list
        response_data.css('.resource-list--release-list-item')
      end

      def title(album)
        album.css(
          '.resource-list--release-list-item-name a'
        ).text
      end

      def artist(album)
        album.css(
          '.resource-list--release-list-item-artist a'
        ).text
      end

      def cover(album)
        album.css(
          '.resource-list--release-list-item-image img'
        )[0]['src'].sub('/300x300', '')
      end

      def listeners_count(album)
        album.css(
          '.resource-list--release-list-item-listeners'
        ).text.scan(/\d/).join.to_i
      end
    end
  end
end
