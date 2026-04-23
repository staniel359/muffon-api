module YouTube
  module Video
    class Tags < YouTube::Video::Info
      private

      def video_data
        Muffon::Formatter::Video::Tags.call(
          tags:
        )
      end
    end
  end
end
