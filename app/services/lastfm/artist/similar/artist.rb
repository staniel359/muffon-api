module LastFM
  module Artist
    class Similar
      class Artist < LastFM::Artist::Similar
        include LastFM::Utils::Artist

        def call
          data
        end

        private

        def data
          return artist_minimal_data if @args[:minimal]

          muffon_data
            .merge(artist_data)
        end

        def artist_minimal_data
          { name: }
        end

        def artist
          @args[:artist]
        end

        def artist_data
          {
            source: source_data,
            name:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def image_data
          image_data_formatted(
            artist['image']
          )
        end
      end
    end
  end
end
