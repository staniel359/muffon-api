module YandexMusic
  module Album
    class Base < YandexMusic::Base
      include YandexMusic::Utils::Album

      private

      def primary_args
        [@args.album_id]
      end

      def no_data?
        yandex_music_id.blank?
      end

      def album
        @album ||= response_data
      end

      def link
        "#{BASE_LINK}/album.jsx"
      end

      def params
        super.merge(album_params)
      end

      def album_params
        { album: @args.album_id }
      end

      def data
        { album: album_data }
      end
    end
  end
end
