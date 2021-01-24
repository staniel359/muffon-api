module LastFM
  module Tag
    class Artists < LastFM::Tag::Web::Base
      private

      def collection_name
        'artists'
      end

      def artists
        artists_list.map { |a| artist_data(a) }
      end

      def artists_list
        response_data.css('.big-artist-list-item')
      end

      def artist_data(artist)
        {
          name: artist_name(artist),
          images: images_data(image(artist), 'artist'),
          listeners_count: listeners_count(artist)
        }
      end

      def artist_name(artist)
        artist.css('.big-artist-list-title').text
      end

      def image(artist)
        artist.css(
          '.big-artist-list-avatar-desktop img'
        )[0]['src']
      end

      def listeners_count(artist)
        artist.css(
          '.big-artist-list-listeners'
        ).text.scan(/\d/).join.to_i
      end
    end
  end
end
