module AmazonMusic
  module Track
    class Links < AmazonMusic::Track::Base
      include AmazonMusic::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Source::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: amazonmusic_id
        )
      end
    end
  end
end
