module RateYourMusic
  module Search
    class Base < RateYourMusic::Base
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def no_data?
        collection_list.blank?
      end

      def collection_list
        @collection_list ||=
          response_data.css(
            '.infobox'
          )
      end

      def response_data
        Nokogiri::HTML.parse(
          response
        )
      end

      def response
        RestClient.get(
          link, headers
        )
      end

      def link
        'https://rateyourmusic.com/search'
      end

      def params
        {
          searchterm: @args[:query],
          searchtype: search_type,
          page:
        }
      end

      def search_type
        self.class::SEARCH_TYPE
      end

      def data
        { search: search_data }
      end

      alias search_data paginated_data
    end
  end
end
