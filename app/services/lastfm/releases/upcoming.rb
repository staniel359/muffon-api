module LastFM
  module Releases
    class Upcoming < LastFM::Releases::Base
      private

      def link
        'https://www.last.fm/music/+releases/coming-soon/popular'
      end
    end
  end
end
