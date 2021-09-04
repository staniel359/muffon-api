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
            vk_id: vk_id,
            image: image_data
          }
        end

        def name
          artist['name']
        end

        def artist
          @artist ||= @args.artist
        end

        def vk_id
          artist['id']
        end

        def image_data
          image_data_formatted(
            artist['photo'], 'artist'
          )
        end
      end
    end
  end
end
