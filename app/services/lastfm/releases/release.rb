module LastFM
  module Releases
    class Release < LastFM::Base
      include LastFM::Mixins::Album

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_album_data
        ]
      end

      def data
        update_album_record!

        Muffon::Formatter::Source::Releases::Albums::Album.call(
          source_original_link:,
          source_name:,
          source_album_id: nil,
          title:,
          artists:,
          image_data:,
          release_date:,
          **self_args
        )
      end

      def title
        raw_album_data
          .css('.resource-list--release-list-item-name')
          .text
          .strip
      end

      def raw_album_data
        @args[:raw_album_data]
      end

      def artist_name
        raw_album_data
          .css('.resource-list--release-list-item-artist')
          .text
          .strip
      end

      def image_url
        raw_album_data
          .css(
            '.resource-list--release-list-item-image img'
          )[0]['src']
      end

      def raw_release_date
        raw_album_data
          .css('.resource-list--release-list-item-date')
          .text
          .strip
      end
    end
  end
end
