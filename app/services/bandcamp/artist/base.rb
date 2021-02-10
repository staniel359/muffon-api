module Bandcamp
  module Artist
    class Base < Bandcamp::API::Creator::Base
      private

      def bandcamp_creator_id
        @args.artist_id
      end
    end
  end
end
