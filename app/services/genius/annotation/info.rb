module Genius
  module Annotation
    class Info < Genius::Base
      private

      def primary_args
        [@args[:annotation_id]]
      end

      def no_data?
        annotation.blank?
      end

      def annotation
        response_data.dig(
          'response', 'referent',
          'annotations', 0,
          'body', 'html'
        )
      end

      def link
        "#{BASE_LINK}/referents/#{@args[:annotation_id]}"
      end

      def params
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
