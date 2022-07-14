module Muffon
  module Utils
    class BackgroundImage < Muffon::Utils::Image
      def call
        data
      end

      private

      def data
        return if image.blank?

        {
          id: image.id,
          original: original_url
        }
      end
    end
  end
end
