module LastFM
  module Artist
    class Shows < LastFM::Artist::Web::Base
      COLLECTION_NAME = 'shows'.freeze

      include LastFM::Utils::Web::Pagination
      include Muffon::Utils::Artist

      private

      def artist_data
        artist_base_data
          .merge(paginated_data)
      end

      def collection_list
        response_data.css(
          '.events-list-item'
        )
      end

      def link
        "#{base_link}/+events"
      end

      def collection_item_data_formatted(show)
        LastFM::Artist::Shows::Show.call(
          show:
        )
      end
    end
  end
end
