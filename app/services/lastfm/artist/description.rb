module LastFM
  module Artist
    class Description < LastFM::Artist::Info
      private

      def artist_data
        { description: description }
      end
    end
  end
end
