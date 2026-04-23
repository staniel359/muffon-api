module YouTubeMusic
  module Album
    class Links < YouTubeMusic::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: youtube_id
        )
      end
    end
  end
end
