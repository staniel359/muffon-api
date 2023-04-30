module MusicBrainz
  module Album
    class Links < MusicBrainz::Album::Info
      private

      def album_data
        { links: source_links }
      end
    end
  end
end
