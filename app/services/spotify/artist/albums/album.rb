module Spotify
  module Artist
    class Albums
      class Album < Spotify::Artist::Albums
        include Spotify::Utils::Album

        def call
          data
        end

        private

        def data
          {
            library_id: library_id,
            title: title,
            spotify_id: spotify_id,
            image: image_data,
            release_date: release_date,
            listeners_count: listeners_count
          }.compact
        end

        def album
          @album ||= @args.album
        end
      end
    end
  end
end
