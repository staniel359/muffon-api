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
          muffon_data.merge(album_data)
        end

        def album_data
          {
            id: id,
            source_id: SOURCE_ID,
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
