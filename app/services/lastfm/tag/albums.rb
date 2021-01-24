module LastFM
  module Tag
    class Albums < LastFM::Tag::Web::Base
      private

      def collection_name
        'albums'
      end

      def albums
        albums_list.map { |a| album_data(a) }
      end

      def albums_list
        response_data.css(
          '.resource-list--release-list-item'
        )
      end

      def album_data(album)
        {
          title: title(album),
          artist: artist_data(album),
          images: images_data(image(album), 'album'),
          listeners_count: listeners_count(album)
        }
      end

      def title(album)
        album.css(
          '.resource-list--release-list-item-name a'
        ).text
      end

      def artist_data(album)
        { name: artist_name(album) }
      end

      def artist_name(album)
        album.css(
          '.resource-list--release-list-item-artist a'
        ).text
      end

      def image(album)
        album.css(
          '.resource-list--release-list-item-image img'
        )[0]['src']
      end

      def listeners_count(album)
        album.css(
          '.resource-list--release-list-item-listeners'
        ).text.scan(/\d/).join.to_i
      end
    end
  end
end
