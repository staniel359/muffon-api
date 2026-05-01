module SoundCloud
  module Artist
    class Base < SoundCloud::Base
      def call
        check_args

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_client_id
      rescue Faraday::BadRequestError, Faraday::ResourceNotFound
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
        artist_info_data.dig(
          :artist,
          :name
        )
      end

      def artist_info_data
        @artist_info_data ||=
          SoundCloud::Artist::Info.call(
            artist_id: @args[:artist_id]
          )
      end

      def request_url
        "#{REQUEST_BASE_URL}/users/#{@args[:artist_id]}"
      end

      alias raw_artist_data response_data
    end
  end
end
