module Discogs
  module Mixins
    module Label
      private

      def name
        raw_label_data['name']
      end

      def discogs_id
        raw_label_data['id']
      end

      def source_original_link
        "https://www.discogs.com/label/#{discogs_id}"
      end

      def image_data
        Discogs::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        (primary_image_url || raw_images[0]).try(:[], 'uri')
      end

      def primary_image_url
        raw_images.find do |raw_image_data|
          raw_image_data['type'] == 'primary'
        end
      end

      def raw_images
        raw_label_data['images']
      end

      def description
        raw_label_data['profile']
      end
    end
  end
end
