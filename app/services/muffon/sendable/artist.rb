module Muffon
  module Sendable
    class Artist < Muffon::Base
      include Muffon::Utils::Artist

      def call
        data
      end

      private

      def data
        {
          name:,
          image: image_data,
          listeners_count:
        }
      end

      def name
        artist['name']
      end

      def artist
        @args[:artist]
      end
    end
  end
end
