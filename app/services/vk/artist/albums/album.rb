module VK
  module Artist
    class Albums
      class Album < VK::Artist::Albums
        include VK::Utils::Album

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(album_id_data)
            .merge(album_base_data)
            .merge(album_extra_data)
        end

        def album_id_data
          {
            source_id: SOURCE_ID,
            vk_id: vk_id,
            vk_owner_id: vk_owner_id,
            vk_access_key: vk_access_key
          }
        end

        def album
          @args[:album]
        end

        def album_base_data
          {
            title: title,
            extra_title: extra_title,
            artist: artist_formatted,
            artists: artists
          }.compact
        end

        def album_extra_data
          {
            image: image_data,
            release_date: release_date
          }
        end
      end
    end
  end
end
