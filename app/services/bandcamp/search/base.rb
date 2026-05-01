module Bandcamp
  module Search
    class Base < Bandcamp::Base
      REQUEST_BASE_URL =
        'https://bandcamp.com/api' \
        '/bcsearch_public_api/1/autocomplete_elastic'.freeze
      SCOPES_TYPES_DATA = {
        'artists' => 'b',
        'albums' => 'a',
        'tracks' => 't'
      }.freeze

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

      def response_data
        @response_data ||=
          Muffon::Request.call(
            url: request_url,
            method: 'POST',
            payload: request_payload
          )
      end

      def request_url
        REQUEST_BASE_URL
      end

      def request_payload
        {
          search_text: @args[:query],
          full_page: false
        }
      end
    end
  end
end
