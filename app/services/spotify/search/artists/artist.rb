module Spotify
  module Search
    class Artists
      class Artist < Spotify::Search::Artists
        include Spotify::Utils::Artist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_artist_data
          ]
        end

        def data
          {
            **self_data,
            source: source_data,
            name:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def raw_artist_data
          @args[:raw_artist_data]['data']
        end
      end
    end
  end
end
