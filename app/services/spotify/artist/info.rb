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

      def name
        artist['name']
      end

      alias artist response_data
    end
  end
end
