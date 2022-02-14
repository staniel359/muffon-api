module VK
  module Search
    class Albums
      class Album < VK::Search::Albums
        include VK::Utils::Album

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(album_id_data)
            .merge(album_base_data)
        end

        def album_id_data
          {
            source_id: SOURCE_ID,
            vk_id:,
            vk_owner_id:,
            vk_access_key:
          }
        end

        def album
          @args[:album]
        end

        def album_base_data
          {
            title:,
            extra_title:,
            artists:,
            image: image_data
          }.compact
        end
      end
    end
  end
end
