module Bandcamp
  module Album
    class Base < Bandcamp::Base
      private

      def data
        { album: album_data }
      end

      def description
        base_data['description'].to_s
      end

      def tags
        base_data['keywords'].split(', ')
      end
    end
  end
end
