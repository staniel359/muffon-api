module Audius
  module Utils
    class Image < Audius::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          images_data
        ]
      end

      def data
        return if @args[:images_data].blank?

        {
          original: image_formatted('1000x1000'),
          large: image_formatted('480x480'),
          medium: image_formatted('480x480'),
          small: image_formatted('150x150'),
          extrasmall: image_formatted('150x150')
        }
      end

      def image_formatted(key)
        if image_link_mirrors.present?
          replace_url_host(
            url: @args[:images_data][key],
            new_host: image_link_mirrors[-1]
          )
        else
          @args[:images_data][key]
        end
      end

      def image_link_mirrors
        @args[:images_data]['mirrors']
      end
    end
  end
end
