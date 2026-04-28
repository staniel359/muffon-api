module AmazonMusic
  module Album
    class Links < AmazonMusic::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: amazonmusic_id
        )
      end
    end
  end
end
