module RateYourMusic
  module Artist
    class Base < RateYourMusic::Base
      def call
        return handlers[:not_found] if wrong_artist_id?

        super
      end

      private

      def wrong_artist_id?
        @args.artist_id.to_i.to_s !=
          @args.artist_id
      end

      def data
        { artist: artist_data }
      end
    end
  end
end
