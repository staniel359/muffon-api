module SoundCloud
  module Track
    class Description < SoundCloud::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Description.call(
          description:
        )
      end
    end
  end
end
