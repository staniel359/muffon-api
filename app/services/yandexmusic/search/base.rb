module YandexMusic
  module Search
    class Base < YandexMusic::Base
      MAXIMUM_ITEMS_COUNT = 10_000

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          query
        ]
      end

      def data
        { search: search_data }
      end

      def link
        "#{BASE_LINK}/music-search.jsx"
      end

      def params
        {
          **super,
          text: @args[:query],
          page: page - 1
        }
      end

      def page
        super.to_i
      end
    end
  end
end
