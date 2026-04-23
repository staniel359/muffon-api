module LastFM
  module Formatter
    class Description < LastFM::Base
      DESCRIPTION_REGEXP =
        %r{(.+)<a href="http(s?)://www.last.fm}m

      def call
        return if @args[:description].blank?

        data
      end

      private

      def data
        @args[:description]
          .match(DESCRIPTION_REGEXP)[1]
          .strip
      end
    end
  end
end
