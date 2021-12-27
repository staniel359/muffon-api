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
            source_id: SOURCE_ID,
            title: title,
            artists: artists,
            image: image_data,
            listeners_count: listeners_count
          }.compact
        end

        def album
          @args[:album]
        end
      end
    end
  end
end
