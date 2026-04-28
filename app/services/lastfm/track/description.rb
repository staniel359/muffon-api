module LastFM
  module Track
    class Description < LastFM::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Description.call(
          description:
        )
      end
    end
  end
end
