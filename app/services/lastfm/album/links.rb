module LastFM
  module Album
    class Links < LastFM::Album::Info
      private

      def album_data
        { links: source_links_data }
      end
    end
  end
end
