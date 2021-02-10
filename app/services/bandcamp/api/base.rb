module Bandcamp
  module API
    class Base < Bandcamp::Base
      private

      def no_data?
        id_data[:id].blank? || super
      end

      def id_data
        @id_data ||= Bandcamp::ID.call(link: id_link)
      end

      def artist_id_link
        "https://#{bandcamp_artist_name}.bandcamp.com"
      end

      def bandcamp_artist_name
        @args.artist || @args.label
      end

      def image(data)
        "https://f4.bcbits.com/img/a#{data['art_id']}_10.jpg"
      end
    end
  end
end
