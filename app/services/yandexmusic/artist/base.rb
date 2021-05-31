module YandexMusic
  module Artist
    class Base < YandexMusic::Base
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args.artist_id]
      end

      def link
        "#{BASE_LINK}/artist.jsx"
      end

      def params
        super.merge(artist_params)
      end

      def artist_params
        { artist: @args.artist_id }
      end

      def data
        { artist: artist_data }
      end
    end
  end
end
