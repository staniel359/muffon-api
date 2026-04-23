module VK
  module Formatter
    class Image < VK::Base
      def call
        data
      end

      private

      def data
        if @args[:raw_images].present?
          array_image_data
        elsif @args[:raw_image_data].present?
          data_image_data
        end
      end

      def array_image_data
        {
          original: @args[:raw_images].dig(3, 'url'),
          large: @args[:raw_images].dig(3, 'url'),
          medium: @args[:raw_images].dig(3, 'url'),
          small: @args[:raw_images].dig(1, 'url'),
          extrasmall: @args[:raw_images].dig(2, 'url')
        }
      end

      def data_image_data
        {
          original: @args[:raw_image_data]['photo_1200'],
          large: @args[:raw_image_data]['photo_600'],
          medium: @args[:raw_image_data]['photo_300'],
          small: @args[:raw_image_data]['photo_135'],
          extrasmall: @args[:raw_image_data]['photo_68']
        }
      end
    end
  end
end
