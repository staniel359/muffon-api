module LastFM
  module Releases
    class Base < LastFM::Base
      include LastFM::Utils::Web
      include LastFM::Utils::Web::Pagination

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

      def collection_item_data_formatted(album)
        LastFM::Releases::Release.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
