module Discogs
  module Label
    class Info < Discogs::Label::Base
      MODEL_NAME = 'label'.freeze

      private

      def label_data
        label_base_data
          .merge(with_more_data)
      end

      def label_base_data
        {
          source: source_data,
          name: artist['name'],
          image: image_data,
          description:
            description_truncated
        }.compact
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
      end

      def description
        artist['profile'].presence
      end
    end
  end
end
