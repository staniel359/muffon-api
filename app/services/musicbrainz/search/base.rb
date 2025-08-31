module MusicBrainz
  module Search
    class Base < MusicBrainz::Base
      TOTAL_LIMIT = 10_000

      include MusicBrainz::Utils::Pagination

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

      def link
        "#{BASE_LINK}/#{model_name}"
      end

      def params
        {
          **super,
          query: @args[:query],
          **pagination_params
        }
      end

      def data
        { search: paginated_data }
      end

      def collection_count
        response_data['count']
      end

      def collection_list
        response_data[
          response_collection_name
        ]
      end

      def response_collection_name
        model_name.pluralize
      end
    end
  end
end
