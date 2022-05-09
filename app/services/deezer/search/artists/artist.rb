module Deezer
  module Search
    class Artists
      class Artist < Deezer::Search::Artists
        include Muffon::Utils::Artist

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
            deezer_id: artist['ART_ID'].to_i,
            name:,
            image: image_data,
            listeners_count: artist['NB_FAN']
          }.compact
        end

        def name
          artist['ART_NAME']
        end

        def artist
          @args[:artist]
        end

        def image_data
          image_data_formatted(
            artist['ART_PICTURE'], 'artist'
          )
        end
      end
    end
  end
end
