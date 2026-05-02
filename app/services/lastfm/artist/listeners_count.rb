module LastFM
  module Artist
    class ListenersCount < LastFM::Artist::Info
      private

      def artist_data
        update_artist_record!

        { listeners_count: }
      end
    end
  end
end
