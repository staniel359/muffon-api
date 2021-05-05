module RateYourMusic
  module Artist
    class Albums
      class Album < Muffon::Base
        def call
          data
        end

        private

        def data
          primary_data.merge(extra_data)
        end

        def primary_data
          {
            title: main_block.text,
            rateyourmusic_id: link_split.dig(-1, 0),
            artists: artists_data,
            rateyourmusic_artist_id: link_split.dig(-2, 0)
          }.compact
        end

        def main_block
          @main_block ||= @args.album.css('.album')[0]
        end

        def link_split
          main_block['href'].scan(%r{/([\w-]+)})
        end

        def artists_data
          return if artists.blank?

          artists.map { |a| { name: a.text } }
        end

        def artists
          @artists ||= @args.album.css('.disco_sub_artist')
        end

        def extra_data
          {
            image: image_data,
            released: released,
            reviews_count: reviews_count,
            ratings_count: ratings_count,
            rating: rating
          }
        end

        def image_data
          return default_image if no_image?

          {
            extrasmall: format_image_link(image_extrasmall),
            small: format_image_link(image_small),
            medium: format_image_link(image_medium),
            large: format_image_link(image_medium),
            original: format_image_link(image_medium)
          }
        end

        def no_image?
          image['class'].include?('image_release_blank')
        end

        def image
          @image ||= @args.album.css('.image_release')[0]
        end

        def default_image
          LastFM::Utils::Image.call(model: 'album')
        end

        def image_extrasmall
          matched_image(image_srcset.split(',')[0])
        end

        def image_srcset
          @image_srcset ||= image.attribute_nodes.find do |n|
            n.name.in?(%w[srcset data-srcset])
          end.value
        end

        def matched_image(string)
          string.match(/e.snmc.io\S+/)[0]
        end

        def format_image_link(string)
          "https://#{string}"
        end

        def image_small
          matched_image(image_srcset.split(',')[1])
        end

        def image_medium
          matched_image(image_tiptip)
        end

        def image_tiptip
          image.attribute_nodes.find do |n|
            n.name.in?(%w[tiptip data-tiptip])
          end.value
        end

        def released
          @args.album.css(
            '[class^="disco_year_"]'
          )[0]['title'].strip
        end

        def reviews_count
          @args.album.css('.disco_reviews')[0].text.to_i
        end

        def ratings_count
          @args.album.css('.disco_ratings')[0].text.to_i
        end

        def rating
          @args.album.css('.disco_avg_rating')[0].text.to_f
        end
      end
    end
  end
end
