module MusicBrainz
  module Search
    class Base < MusicBrainz::Base
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

      def params
        {
          **super,
          query: @args[:query],
          limit:,
          offset:
        }
      end

      def data
        { search: search_data }
      end

      def items_count
        response_data['count']
      end

      def maximum_items_count
        pagination_maximum_items_count_data[:search]
      end
    end
  end
end
