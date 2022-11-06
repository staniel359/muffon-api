module LastFM
  module Releases
    class Base < LastFM::Web::Base
      COLLECTION_NAME = 'albums'.freeze

      include Muffon::Utils::Pagination

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
        response_data.css(
          '.pagination-page'
        ).last.text.to_i
      end

      def collection_list
        response_data.css(
          '.resource-list--release-list-item'
        )
      end

      def collection_item_data_formatted(album)
        LastFM::Releases::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
