module Discogs
  module Label
    class Info < Discogs::Base
      private

      def primary_args
        [@args.label_id]
      end

      def data
        { label: label_data }
      end

      def label_data
        {
          name: response_data['name'],
          images: images(main_image, 'artist'),
          description: response_data['profile']
        }
      end

      def link
        "#{base_link}/labels/#{@args.label_id}"
      end
    end
  end
end
