module LastFM
  module Multitag
    class Artists
      class Artist < LastFM::Multitag::Artists
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
          self_data
            .merge(artist_data)
        end

        def artist
          @args[:artist]
        end

        def artist_data
          {
            source: source_data,
            name:,
            listeners_count:,
            plays_count:,
            image: image_data
          }.compact
        end

        def listeners_count
          artist['listeners'].to_i
        end

        def plays_count
          artist['scrobbles'].to_i
        end

        def image
          artist['image']
        end
      end
    end
  end
end
