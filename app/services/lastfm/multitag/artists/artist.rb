module LastFM
  module Multitag
    class Artists
      class Artist < LastFM::Multitag::Artists
        include LastFM::Utils::Artist

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(artist_data)
        end

        def artist_data
          {
            name:,
            listeners_count:
              artist['listeners'].to_i,
            plays_count:
              artist['scrobbles'].to_i,
            image: image_data
          }.compact
        end

        def artist
          @args[:artist]
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
