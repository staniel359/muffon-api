module Genius
  module Album
    class Base < Genius::Base
      include Genius::Utils::Album

      def call
        check_args

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          album_id
        ]
      end

      def album
        response_data.dig(
          'response',
          'album'
        )
      end

      def link
        "#{BASE_LINK}/albums/#{@args[:album_id]}"
      end

      def data
        { album: album_data }
      end
    end
  end
end
