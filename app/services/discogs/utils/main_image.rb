module Discogs
  module Utils
    class MainImage < Discogs::Base
      def call
        data
      end

      private

      def data
        return if images_list.blank?

        (primary_image || images_list[0])['uri']
      end

      def images_list
        @args.response_data['images']
      end

      def primary_image
        images_list.find { |i| i['type'] == 'primary' }
      end
    end
  end
end
