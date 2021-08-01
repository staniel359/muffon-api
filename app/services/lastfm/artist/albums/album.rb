module LastFM
  module Artist
    class Albums
      class Album < LastFM::Artist::Albums
        include LastFM::Utils::Album

        def call
          data
        end

        private

        def data
          {
            library_id: library_id,
            title: title,
            image: image_data,
            listeners_count: listeners_count
          }.compact
        end

        def album
          @album ||= @args.album
        end

        def artist_name
          album.dig('artist', 'name')
        end
      end
    end
  end
end
