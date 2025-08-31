module LastFM
  module Artist
    class Similar
      class Artist < LastFM::Artist::Similar
        include LastFM::Utils::Artist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            artist
          ]
        end

        def data
          return artist_minimal_data if @args[:minimal]

          self_data
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
            listeners_count:,
            profiles_count:
          }.compact
        end

        def name
          artist['name']
        end

        def image
          artist['image'][0]['#text'] ||
            artist['image']
        end
      end
    end
  end
end
