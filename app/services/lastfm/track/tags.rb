module LastFM
  module Track
    class Tags < LastFM::Track::Base
      API_METHOD = 'track.getTopTags'.freeze

      include LastFM::Mixins::Track

      private

      def raw_track_data
        response_data['toptags']
      end

      def track_data
        Muffon::Formatter::Track::Tags.call(
          tags:
        )
      end

      def raw_tags
        raw_track_data['tag']
      end
    end
  end
end
