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
            id: id,
            source_id: SOURCE_ID,
            vk_id: vk_id,
            vk_owner_id: vk_owner_id,
            vk_access_key: vk_access_key
          }
        end

        def album
          @album ||= @args.album
        end

        def album_base_data
          {
            title: title,
            extra_title: extra_title,
            artist: artist_formatted,
            artists: artists,
            image: image_data
          }.compact
        end
      end
    end
  end
end
