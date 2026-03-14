module Spotify
  module Artist
    class Base < Spotify::Base
      include Spotify::Utils::Artist

      def call
        check_args

        check_if_not_found

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_spotify_token
      end

      private

      def required_args
        %i[
          artist_id
        ]
      end

      def not_found?
        raw_artist_data.blank?
      end

      def raw_artist_data
        response_data.dig(
          'data',
          'artistUnion'
        )
      end

      def spotify_uri
        "spotify:artist:#{@args[:artist_id]}"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      def artist_info_data
        @artist_info_data ||=
          Spotify::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      alias response post_response
    end
  end
end
