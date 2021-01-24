module LastFM
  module Track
    class Base < LastFM::API::Base
      private

      def primary_args
        [@args.artist, @args.track]
      end

      def params
        super.merge(track_params)
      end

      def data
        { track: track_data }
      end

      def artist_data
        { name: artist_name }
      end

      def artist_name
        response_data.dig('artist', 'name')
      end
    end
  end
end
