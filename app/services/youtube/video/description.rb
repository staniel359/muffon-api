module YouTube
  module Video
    class Description < YouTube::Video::Info
      private

      def video_data
        Muffon::Formatter::Video::Description.call(
          description:
        )
      end
    end
  end
end
