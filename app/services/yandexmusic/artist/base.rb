module YandexMusic
  module Artist
    class Base < YandexMusic::Base
      include Muffon::Utils::Pagination

      def call
        check_args

        data
      rescue Faraday::ResourceNotFound, Faraday::BadRequestError
        raise not_found_error
      end

      private

      def required_args
        %i[
          artist_id
        ]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      def name
        artist.dig(
          'artist',
          'name'
        )
      end

      def link
        "#{BASE_LINK}/artist.jsx"
      end

      def params
        { artist: @args[:artist_id] }
      end

      alias artist response_data
    end
  end
end
