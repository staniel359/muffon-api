module LastFM
  module Artist
    class Tags < LastFM::Artist::Base
      API_METHOD = 'artist.getTopTags'.freeze

      include LastFM::Mixins::Artist

      private

      def raw_artist_data
        response_data['toptags']
      end

      def artist_data
        Muffon::Formatter::Source::Artist::Tags.call(
          tags:
        )
      end

      def raw_tags
        raw_artist_data['tag']
      end
    end
  end
end
