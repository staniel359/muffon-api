module Discogs
  module Label
    class Info < Discogs::Base
      private

      def primary_args
        [@args.label_id]
      end

      def link
        "#{base_link}/labels/#{@args.label_id}"
      end

      def data
        { label: label_data }
      end

      def label_data
        label_base_data.merge(with_more_data)
      end

      def label_base_data
        {
          name: response_data['name'],
          image: image_data(main_image, 'artist'),
          description: description_truncated
        }
      end

      def description
        response_data['profile']
      end
    end
  end
end
