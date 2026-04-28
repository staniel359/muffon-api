module MusicBrainz
  module Track
    class Tags < MusicBrainz::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Tags.call(
          tags:
        )
      end
    end
  end
end
