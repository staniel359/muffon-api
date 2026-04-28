module LastFM
  module Artist
    class Description < LastFM::Artist::Info
      private

      def artist_data
        Muffon::Formatter::Source::Artist::Description.call(
          description:
        )
      end
    end
  end
end
