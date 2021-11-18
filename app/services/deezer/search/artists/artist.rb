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
            deezer_id: deezer_id,
            name: name,
            image: image_data,
            listeners_count: listeners_count
          }
        end

        def name
          artist['ART_NAME']
        end

        def artist
          @args[:artist]
        end

        def deezer_id
          artist['ART_ID'].to_i
        end

        def image_data
          image_data_formatted(
            artist['ART_PICTURE'], 'artist'
          )
        end

        def listeners_count
          artist['NB_FAN']
        end
      end
    end
  end
end
