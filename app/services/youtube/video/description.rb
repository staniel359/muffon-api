module YouTube
  module Video
    class Description < YouTube::Video::Info
      private

      def video_data
        Muffon::Formatter::Source::Video::Description.call(
          description:
        )
      end
    end
  end
end
