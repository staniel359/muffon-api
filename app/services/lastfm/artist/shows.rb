module LastFM
  module Artist
    class Shows < LastFM::Artist::Web::Base
      include LastFM::Mixins::Web::Pagination
      include Muffon::Utils::Artist

      private

      def artist_data
        {
          **super,
          **shows_data
        }
      end

      def shows_data
        paginated_data(
          collection_name: 'shows',
          raw_collection:,
          page:,
          limit:,
          pages_count:
        )
      end

      def raw_collection
        response_data.css(
          '.events-list-item'
        )
      end

      def link
        "#{base_link}/+events"
      end

      def collection_item_data_formatted(
        raw_show_data
      )
        LastFM::Artist::Shows::Show.call(
          raw_show_data:
        )
      end
    end
  end
end
