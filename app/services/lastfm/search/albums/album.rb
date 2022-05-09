module LastFM
  module Search
    class Albums
      class Album < LastFM::Search::Albums
        include LastFM::Utils::Album

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(album_data)
        end

        def album_data
          {
            source_id:,
            title:,
            artist: artist_names_data,
            artists:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def album
          @args[:album]
        end
      end
    end
  end
end
