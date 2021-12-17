module Discogs
  module Label
    class Info < Discogs::Label::Base
      private

      def label_data
        label_base_data
          .merge(with_more_data)
      end

      def label_base_data
        {
          name: name,
          discogs_id: discogs_id,
          image: image_data,
          description: description_truncated
        }.compact
      end

      def name
        artist['name']
      end

      def description
        artist['profile']
      end
    end
  end
end
