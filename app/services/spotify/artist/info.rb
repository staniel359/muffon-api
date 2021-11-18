module Spotify
  module Artist
    class Info < Spotify::Artist::Base
      private

      def primary_args
        [@args[:artist_id]]
      end

      def no_data?
        artist.blank?
      end

      def artist
        @artist ||= response_data
      end

      def name
        artist['name']
      end
    end
  end
end
