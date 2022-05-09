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

      def album
        response_data['result']
      end

      def link
        "#{BASE_LINK}/albums"\
          "/#{@args[:album_id]}/with-tracks"
      end

      def data
        { album: album_data }
      end
    end
  end
end
