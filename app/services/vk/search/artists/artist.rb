module VK
  module Search
    class Artists
      class Artist < VK::Search::Artists
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
            id: id,
            vk_id: vk_id,
            name: name,
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
