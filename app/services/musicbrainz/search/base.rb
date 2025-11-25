module MusicBrainz
  module Search
    class Base < MusicBrainz::Base
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
    end
  end
end
