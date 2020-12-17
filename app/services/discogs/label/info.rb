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
          image: image,
          description: response_data['profile']
        }
      end

      def api_link
        "https://api.discogs.com/labels/#{@args.label_id}"
      end
    end
  end
end
