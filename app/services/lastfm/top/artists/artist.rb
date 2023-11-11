module LastFM
  module Top
    class Artists
      class Artist < LastFM::Top::Artists
        include LastFM::Utils::Artist

        def call
          data
        end

        private

        def data
          return artist_minimal_data if @args[:minimal]

          update_artist_image

          self_data
            .merge(artist_data)
        end

        def artist_minimal_data
          { name: }
        end

        def artist
          @args[:artist]
        end

        def update_artist_image
          return if test?

          find_artist.update(
            image_url:
          )
        end

        def image_url
          default_image? ? 'MISSING' : image
        end

        def image
          artist['image']
        end

        def artist_data
          {
            source: source_data,
            name:,
            image: image_data,
            listeners_count:
          }.compact
        end
      end
    end
  end
end
