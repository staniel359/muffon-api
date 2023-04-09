module MusicBrainz
  module Album
    class Tags < MusicBrainz::Album::Info
      private

      def album_data
        { tags: }
      end
    end
  end
end
