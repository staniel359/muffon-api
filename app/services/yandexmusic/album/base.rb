module YandexMusic
  module Album
    class Base < YandexMusic::Base
      include YandexMusic::Utils::Album

      private

      def primary_args
        [@args[:album_id]]
      end

      def no_data?
        album.blank?
      end

      def link
        "#{BASE_LINK}/album.jsx"
      end

      def params
        { album: @args[:album_id] }
      end

      def data
        { album: album_data }
      end

      alias album response_data
    end
  end
end
