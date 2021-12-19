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

      def artist
        @artist ||=
          response_data['result']
      end

      def link
        "#{BASE_LINK}/artists/#{@args[:artist_id]}"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: name }
      end

      def name
        artist.dig(
          'artist', 'name'
        )
      end
    end
  end
end
