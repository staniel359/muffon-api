module LastFM
  module Utils
    class Description < LastFM::Base
      def call
        data
      end

      private

      def data
        return '' if raw_description.blank?

        raw_description.match(description_regexp)[1].strip
      end

      def raw_description
        @args.data.dig('bio', 'content') ||
          @args.data.dig('wiki', 'content')
      end

      def description_regexp
        %r{(.+)<a href="http(s?)://www.last.fm}m
      end
    end
  end
end
