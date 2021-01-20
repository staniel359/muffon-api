module Discogs
  module Artist
    class Info < Discogs::Base
      private

      def primary_args
        [@args.artist_id]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        {
          name: response_data['name'],
          images: images(main_image, 'artist'),
          description: response_data['profile']
        }
      end

      def link
        "#{base_link}/artists/#{@args.artist_id}"
      end
    end
  end
end
