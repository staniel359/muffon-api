module SoundCloud
  module Album
    class Links < SoundCloud::Album::Info
      private

      def album_data
        { links: source_links }
      end
    end
  end
end
