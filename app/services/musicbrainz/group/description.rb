module MusicBrainz
  module Group
    class Description < MusicBrainz::Group::Base
      BASE_LINK =
        'https://musicbrainz.org'.freeze

      private

      def group_data
        { description: }
      end

      def description
        response_data.css(
          '.wikipedia-extract-body'
        ).css(
          'p:not([class=mw-empty-elt])'
        ).map(
          &:text
        ).join(
          "\n"
        ).strip
      end

      def response_data
        @response_data ||=
          Nokogiri::HTML.parse(
            response
          )
      end
    end
  end
end
