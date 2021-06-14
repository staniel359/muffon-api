module RateYourMusic
  module Search
    class Labels
      class Label < RateYourMusic::Search::Labels
        def call
          data
        end

        private

        def data
          {
            name: name,
            rateyourmusic_slug: rateyourmusic_slug,
            image: image_data
          }
        end

        def name
          label.css('.label')[0].text
        end

        def label
          @label ||= @args.label
        end

        def rateyourmusic_slug
          raw_rateyourmusic_slug.match(
            %r{/label/(.+)/}
          )[1]
        end

        def raw_rateyourmusic_slug
          label.css('.label')[0]['href']
        end

        def image_data
          image_data_formatted(
            image, 'artist'
          )
        end

        def image
          raw_image.try(:[], 'data-src')
        end

        def raw_image
          @raw_image ||= label.css(
            '.page_search_img'
          )[0]
        end
      end
    end
  end
end
