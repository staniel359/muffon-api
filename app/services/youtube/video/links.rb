module YouTube
  module Video
    class Links < YouTube::Video::Info
      private

      def video_data
        Muffon::Formatter::Source::Video::Links.call(
          source_original_link:,
          source_name:,
          source_video_id: youtube_id
        )
      end
    end
  end
end
