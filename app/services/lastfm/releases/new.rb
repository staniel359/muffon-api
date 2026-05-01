module LastFM
  module Releases
    class New < LastFM::Releases::Base
      private

      def request_url
        "#{super}/out-now/popular"
      end
    end
  end
end
