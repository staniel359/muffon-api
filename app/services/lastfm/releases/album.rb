module LastFM
  module Releases
    class Album < LastFM::Releases::Base
      include LastFM::Utils::Album

      def call
        data
      end

      private

      def data
        muffon_data
          .merge(album_data)
      end

      def album_data
        {
          title:,
          artists:,
          image: image_data
        }.compact
      end

      def title
        album.css(
          '.resource-list--release-list-item-name'
        ).text.strip
      end

      def album
        @args[:album]
      end

      def artist_name
        album.css(
          '.resource-list--release-list-item-artist'
        ).text.strip
      end

      def image
        album.css(
          '.resource-list--release-list-item-image img'
        )[0]['src']
      end
    end
  end
end
