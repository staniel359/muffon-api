module LastFM
  module Releases
    class New < LastFM::Releases::Base
      private

      def link
        "#{BASE_LINK}/out-now/popular"
      end
    end
  end
end
