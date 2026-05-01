module Genius
  module Annotation
    class Info < Genius::Base
      def call
        check_args

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          annotation_id
        ]
      end

      def annotation
        response_data.dig(
          'response',
          'referent',
          'annotations',
          0,
          'body',
          'html'
        )
      end

      def request_url
        "#{REQUEST_BASE_URL}/referents/#{@args[:annotation_id]}"
      end

      def request_params
        { text_format: 'html' }
      end

      def data
        { annotation: annotation_data }
      end

      def annotation_data
        { text: annotation }
      end
    end
  end
end
