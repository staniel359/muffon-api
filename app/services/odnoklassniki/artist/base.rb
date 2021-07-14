module Odnoklassniki
  module Artist
    class Base < Odnoklassniki::Base
      ENDPOINT_NAME = 'artist'.freeze

      private

      def primary_args
        [@args.artist_id]
      end

      def params
        super.merge(artist_params)
      end

      def artist_params
        { artistId: @args.artist_id }
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: name }
      end
    end
  end
end
