module MusicBrainz
  module Track
    class Links < MusicBrainz::Track::Info
      private

      def track_data
        { links: source_links }
      end
    end
  end
end
