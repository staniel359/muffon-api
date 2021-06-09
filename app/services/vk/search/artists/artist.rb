module VK
  module Search
    class Artists
      class Artist < VK::Search::Artists
        def call
          data
        end

        private

        def data
          {
            name: name,
            vk_slug: vk_slug,
            image: image_data
          }
        end

        def name
          artist.css('.title_link')[0].text
        end

        def artist
          @artist ||= Nokogiri::HTML.parse(
            @args.artist
          )
        end

        def vk_slug
          raw_vk_slug.match(
            %r{artist/(.+)\?}
          )[1]
        end

        def raw_vk_slug
          artist.css('.title_link')[0]['href']
        end

        def image_data
          image_data_formatted(image, 'artist')
        end

        def image
          return if raw_image.blank?

          raw_image.match(/url\((.+)\)/)[1]
        end

        def raw_image
          @raw_image ||= artist.css(
            '.audio_block_small_item__img'
          )[0]['style']
        end
      end
    end
  end
end
