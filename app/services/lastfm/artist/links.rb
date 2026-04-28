module LastFM
  module Artist
    class Links < LastFM::Artist::Info
      private

      def artist_data
        Muffon::Formatter::Source::Artist::Links.call(
          source_original_link:,
          source_name:,
          source_artist_id: nil
        )
      end
    end
  end
end
