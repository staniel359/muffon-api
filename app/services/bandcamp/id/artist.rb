module Bandcamp
  module Id
    class Artist < Bandcamp::Id::Base
      private

      def primary_args
        [@args[:artist]]
      end

      def model_response
        @model_response ||=
          response_data[3]['data-band'] ||
          response_data[4]['data-band']
      end

      def id_data
        {
          name: model_response_data['name'],
          bandcamp_id:,
          bandcamp_model: model_type
        }
      end

      def model_type
        label? ? 'label' : 'artist'
      end

      def label?
        model_response_data['is_label']
      end

      alias link base_link
    end
  end
end
