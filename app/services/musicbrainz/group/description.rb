module MusicBrainz
  module Group
    class Description < MusicBrainz::Group::Base
      REQUEST_BASE_URL = 'https://musicbrainz.org'.freeze

      private

      def group_data
        Muffon::Formatter::Source::AlbumGroup::Description.call(
          description:
        )
      end

      def description
        response_data
          .css('.wikipedia-extract-body p:not([class=mw-empty-elt])')
          .map(&:text)
          .join("\n")
          .strip
          .presence
      end

      def response_data
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          response_type: 'html',
          params: request_params
        )
      end

      def request_url
        "#{REQUEST_BASE_URL}/release-group/#{@args[:group_id]}"
      end
    end
  end
end
