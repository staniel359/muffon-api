module LastFM
  module Releases
    class Album < LastFM::Releases::Base
      include LastFM::Utils::Album

      def call
        data
      end

      private

      def data
        self_data
          .merge(album_data)
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

      def album_data
        {
          source: source_data,
          title:,
          artist: artist_names_data,
          artists:,
          image: image_data,
          release_date:,
          listeners_count:
        }.compact
      end

      def image
        album.css(
          '.resource-list--release-list-item-image img'
        )[0]['src']
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        album.css(
          '.resource-list--release-list-item-date'
        ).text.strip
      end
    end
  end
end
