module RateYourMusic
  module Search
    class Artists
      class Artist < RateYourMusic::Search::Artists
        def call
          data
        end

        private

        def data
          {
            name: name,
            rateyourmusic_id: rateyourmusic_id,
            image: image_data
          }
        end

        def name
          artist.css(
            '.searchpage'
          )[0].text
        end

        def artist
          @args[:artist]
        end

        def rateyourmusic_id
          raw_rateyourmusic_id.scan(
            /\d/
          ).join.to_i
        end

        def raw_rateyourmusic_id
          artist.css(
            '.searchpage'
          )[0]['title']
        end

        def image_data
          image_data_formatted(
            image, 'artist'
          )
        end

        def image
          raw_image.try(
            :[], 'data-src'
          )
        end

        def raw_image
          @raw_image ||= artist.css(
            '.page_search_img'
          )[0]
        end
      end
    end
  end
end
