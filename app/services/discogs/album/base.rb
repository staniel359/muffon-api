module Discogs
  module Album
    class Base < Discogs::Base
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

      def data
        { album: album_data }
      end

      def link
        "#{BASE_LINK}/releases/#{@args[:album_id]}"
      end

      alias raw_album_data response_data
    end
  end
end
