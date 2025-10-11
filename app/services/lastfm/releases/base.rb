module LastFM
  module Releases
    class Base < LastFM::Base
      COLLECTION_NAME = 'albums'.freeze

      include LastFM::Utils::Web
      include Muffon::Utils::Pagination

      def call
        data
      end

      private

      def link
        "https://www.last.fm/music/+releases/#{scope}/popular"
      end

      def scope
        self.class::SCOPE
      end

      def params
        { page: }
      end

      def data
        { releases: paginated_data }
      end

      def total_pages_count
        response_data
          .css(
            '.pagination-page'
          )
          .last
          &.text
          &.to_i || 1
      end

      def collection_list
        response_data.css(
          '.resource-list--release-list-item'
        ) || []
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
