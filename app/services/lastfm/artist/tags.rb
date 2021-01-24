module LastFM
  module Artist
    class Tags < LastFM::Tags::Base
      private

      def primary_args
        [@args.artist]
      end

      def model_name
        'artist'
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        {
          name: extra_data['artist'],
          tags: tags
        }
      end
    end
  end
end
