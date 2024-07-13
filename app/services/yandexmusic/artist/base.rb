module YandexMusic
  module Artist
    class Base < YandexMusic::Base
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:artist_id]]
      end

      def no_data?
        artist.blank?
      end

      def link
        "#{BASE_LINK}/artist.jsx"
      end

      def params
        { artist: @args[:artist_id] }
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      def name
        artist.dig(
          'artist', 'name'
        )
      end

      alias artist response_data
    end
  end
end
