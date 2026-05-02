module YouTube
  module Video
    class Links < YouTube::Video::Info
      private

      def video_data
        Muffon::Formatter::Source::Video::Links.call(
          video_record:
        )
      end
    end
  end
end
