module LastFM
  module Releases
    class Upcoming < LastFM::Releases::Base
      private

      def request_url
        "#{super}/coming-soon/popular"
      end
    end
  end
end
