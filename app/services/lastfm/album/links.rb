module LastFM
  module Album
    class Links < LastFM::Album::Info
      private

      def album_data
        { links: source_links }
      end
    end
  end
end
