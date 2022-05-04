module LastFM
  module Kerve
    class Base < LastFM::Base
      BASE_LINK = 'https://kerve.last.fm/kerve'.freeze

      private

      def charts_link
        "#{BASE_LINK}/charts"
      end
    end
  end
end
