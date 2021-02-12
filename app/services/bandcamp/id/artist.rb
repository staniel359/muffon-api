module Bandcamp
  module Id
    class Artist < Bandcamp::Id::Base
      private

      def primary_args
        [@args.artist]
      end

      def link
        "https://#{@args.artist}.bandcamp.com"
      end

      def model_response
        response_data[2]['data-band']
      end

      def data
        {
          type: model_type,
          id: model_response_data['id']
        }
      end

      def model_type
        model_response_data['is_label'] ? 'label' : 'artist'
      end
    end
  end
end
