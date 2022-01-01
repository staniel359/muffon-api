module Muffon
  module Utils
    class Image < Muffon::Base
      def call
        data
      end

      private

      def data
        return if image.blank?

        {
          original: original_url,
          large: variant_url(600),
          medium: variant_url(300),
          small: variant_url(100),
          extrasmall: variant_url(50)
        }
      end

      def image
        @args[:image]
      end

      def original_url
        ActiveStorage::Current.set(
          url_options:
        ) do
          image.url
        end
      end

      def url_options
        { host: host }
      end

      def host
        Rails.application.credentials.url
      end

      def variant_url(size)
        ActiveStorage::Current.set(
          url_options:
        ) do
          image.variant(
            loader: { page: nil },
            resize_to_limit: [size, size]
          ).processed.url
        end
      end
    end
  end
end
