module MusicBrainz
  module Track
    class Tags < MusicBrainz::Track::Info
      private

      def track_data
        { tags: }
      end
    end
  end
end
