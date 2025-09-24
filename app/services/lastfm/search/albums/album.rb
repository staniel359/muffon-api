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
          self_data
            .merge(album_data)
        end

        def album
          @args[:album]
        end

        def album_data
          {
            source: source_data,
            title:,
            artist: artists_minimal_data,
            artists:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def listeners_count
          album['listeners'].to_i
        end
      end
    end
  end
end
