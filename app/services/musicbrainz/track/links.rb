module MusicBrainz
  module Track
    class Links < MusicBrainz::Track::Info
      private

      def track_data
        { links: source_links_data }
      end
    end
  end
end
