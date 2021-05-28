module Spotify
  module Artist
    class Base < Spotify::Base
      private

      def primary_args
        [@args.artist_id]
      end

      def link
        "#{BASE_LINK}/artists/#{@args.artist_id}"
      end

      def data
        { artist: artist_data }
      end
    end
  end
end
