module Spotify
  module Album
    class Links < Spotify::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: spotify_id
        )
      end
    end
  end
end
