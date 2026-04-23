module MusicBrainz
  module Track
    class Links < MusicBrainz::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: musicbrainz_id
        )
      end
    end
  end
end
