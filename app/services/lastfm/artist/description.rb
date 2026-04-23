module LastFM
  module Artist
    class Description < LastFM::Artist::Info
      private

      def artist_data
        Muffon::Formatter::Artist::Description.call(
          description:
        )
      end
    end
  end
end
