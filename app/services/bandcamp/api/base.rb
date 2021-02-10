module Bandcamp
  module API
    class Base < Bandcamp::Base
      private

      def no_data?
        super || response_data['error']
      end

      def image(data)
        "https://f4.bcbits.com/img/a#{data['art_id']}_10.jpg"
      end
    end
  end
end
