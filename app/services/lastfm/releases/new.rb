module LastFM
  module Releases
    class New < LastFM::Releases::Base
      private

      def link
        'https://www.last.fm/music/+releases/out-now/popular'
      end
    end
  end
end
