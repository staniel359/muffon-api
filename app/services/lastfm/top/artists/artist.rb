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
          update_listeners_count

          muffon_data
            .merge(artist_data)
        end

        def update_listeners_count
          find_artist.update(
            listeners_count:
              artist['listeners'].to_i
          )
        end

        def artist
          @args[:artist]
        end

        def artist_data
          {
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
