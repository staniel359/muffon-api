module LastFM
  module Releases
    class Upcoming < LastFM::Releases::Base
      private

      def link
        "#{BASE_LINK}/coming-soon/popular"
      end
    end
  end
end
