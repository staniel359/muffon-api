module Spotify
  module Artist
    class Base < Spotify::Base
      private

      def primary_args
        [@args.artist_id]
      end

      def no_data?
        results.blank?
      end

      def base_link
        "https://api.spotify.com/v1/artists/#{@args.artist_id}"
      end
    end
  end
end
