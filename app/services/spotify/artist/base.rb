module Spotify
  module Artist
    class Base < Spotify::Base
      def call
        check_args

        check_if_not_found

        data
      rescue Faraday::UnauthorizedError, Faraday::TooManyRequestsError => e
        # retry_with_new_spotify_token
        raise e
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def required_args
        %i[
          artist_id
        ]
      end

      def not_found?
        name.blank?
      end

      def name
        artist_info_data[:name]
      end

      def artist_info_data
        @artist_info_data ||=
          Spotify::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      def link
        "#{BASE_LINK}/artists/#{@args[:artist_id]}"
      end

      alias artist response_data
    end
  end
end
