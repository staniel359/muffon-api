module LastFM
  module Releases
    class Base < LastFM::Base
      BASE_LINK = 'https://www.last.fm/music/+releases'.freeze

      include LastFM::Mixins::Web
      include LastFM::Mixins::Web::Pagination

      def call
        data
      end

      private

      def data
        { releases: releases_data }
      end

      def releases_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          pages_count:
        )
      end

      def raw_collection
        response_data.css(
          '.resource-list--release-list-item'
        )
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        LastFM::Releases::Release.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
