module MusicBrainz
  module Search
    class Base < MusicBrainz::Base
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def link
        "#{BASE_LINK}/#{model_name}"
      end

      def model_name
        self.class::MODEL_NAME
      end

      def params
        {
          query: @args[:query],
          limit:,
          offset:,
          fmt: 'json'
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
