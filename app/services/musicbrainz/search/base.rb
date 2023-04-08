module MusicBrainz
  module Search
    class Base < MusicBrainz::Base
      include MusicBrainz::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def link
        "#{BASE_LINK}/#{model_name}"
      end

      def params
        super
          .merge(search_params)
          .merge(pagination_params)
      end

      def search_params
        { query: @args[:query] }
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
