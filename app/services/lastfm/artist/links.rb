module LastFM
  module Artist
    class Links < LastFM::Artist::Info
      private

      def artist_data
        { links: source_links }
      end
    end
  end
end
