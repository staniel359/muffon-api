module LastFM
  module Album
    class Links < LastFM::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: nil
        )
      end
    end
  end
end
