module Odnoklassniki
  module Artist
    class Base < Odnoklassniki::Base
      ENDPOINT_NAME = 'artist'.freeze

      def call
        check_args

        return retry_with_new_session_id if retry_with_new_session_id?

        data
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def required_args
        %i[
          artist_id
        ]
      end

      def params
        {
          **super,
          'artistId' => @args[:artist_id]
        }
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

      alias artist response_data
    end
  end
end
