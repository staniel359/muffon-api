module Bandcamp
  module Search
    class Base < Bandcamp::Base
      BASE_LINK =
        'https://bandcamp.com/api/bcsearch_public_api/1' \
        '/autocomplete_elastic'.freeze

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
        { search: search_data }
      end

      def raw_collection
        response_data.dig(
          'auto',
          'results'
        )
      end

      def link
        BASE_LINK
      end

      def payload
        {
          search_text: @args[:query],
          full_page: false
        }
      end

      def model_name
        self.class::MODEL_NAME
      end

      alias response post_response
    end
  end
end
