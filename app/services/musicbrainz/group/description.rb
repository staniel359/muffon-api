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
        html_response_data
          .css('.wikipedia-extract-body p:not([class=mw-empty-elt])')
          .map(&:text)
          .join("\n")
          .strip
          .presence
      end
    end
  end
end
