module LastFM
  module Releases
    class Release < LastFM::Releases::Base
      include LastFM::Utils::Album

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          album
        ]
      end

      def data
        {
          **self_data,
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:,
          image: image_data,
          release_date:,
          listeners_count:
        }.compact
      end

      def title
        album
          .css(
            '.resource-list--release-list-item-name'
          )
          .text
          .strip
      end

      def album
        @args[:album]
      end

      def artist_name
        album
          .css(
            '.resource-list--release-list-item-artist'
          )
          .text
          .strip
      end

      def image
        album
          .css(
            '.resource-list--release-list-item-image img'
          )[0]['src']
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        album
          .css(
            '.resource-list--release-list-item-date'
          )
          .text
          .strip
      end
    end
  end
end
