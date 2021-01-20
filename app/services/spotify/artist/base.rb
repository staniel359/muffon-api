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

      def artist_base_link
        "#{base_link}/artists/#{@args.artist_id}"
      end
    end
  end
end
