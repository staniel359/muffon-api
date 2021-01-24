module LastFM
  module Track
    class Tags < LastFM::Tags::Base
      private

      def primary_args
        [@args.artist, @args.track]
      end

      def model_name
        'track'
      end

      def data
        { track: track_data }
      end

      def track_data
        {
          title: extra_data['track'],
          artist: artist_data,
          tags: tags
        }
      end
    end
  end
end
