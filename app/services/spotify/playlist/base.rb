module Spotify
  module Playlist
    class Base < Spotify::Base
      def call
        check_args

        data
      rescue Faraday::UnauthorizedError, Faraday::TooManyRequestsError
        if spotify_connection.present?
          retry_with_new_session
        else
          retry_with_new_spotify_token
        end
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          playlist_id
        ]
      end

      def link
        "#{BASE_LINK}/playlists/#{@args[:playlist_id]}"
      end

      def data
        { playlist: playlist_data }
      end

      def spotify_token
        spotify_connection&.access_token || super
      end

      def playlist_data
        {
          source: source_data,
          title:,
          description:,
          image: image_data,
          tracks_count:
            tracks_list.size,
          tracks:
        }.compact
      end

      alias playlist response_data
    end
  end
end
