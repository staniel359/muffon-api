module Bandcamp
  module Search
    class Base < Bandcamp::Base
      BASE_LINK =
        'https://bandcamp.com/api' \
        '/bcsearch_public_api/1' \
        '/autocomplete_elastic'.freeze
      SEARCH_TYPES = {
        'artist' => 'b',
        'album' => 'a',
        'track' => 't'
      }.freeze

      include Muffon::Utils::Pagination
      include Bandcamp::Utils::Search

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
        { search: paginated_data }
      end

      def total_items_count
        raw_collection_list.size
      end

      def raw_collection_list
        response_data.dig(
          'auto',
          'results'
        ) || []
      end

      def collection_list
        collection_paginated(
          raw_collection_list
        )
      end

      def link
        BASE_LINK
      end

      def payload
        {
          search_text: @args[:query],
          search_filter: model_type,
          full_page: false
        }
      end

      def model_type
        SEARCH_TYPES[model_name]
      end

      def model_name
        self.class::MODEL_NAME
      end

      alias response post_response
    end
  end
end
