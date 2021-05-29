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
          {
            title: title,
            extra_title: extra_title,
            vk_id: vk_id,
            vk_owner_id: vk_owner_id,
            vk_access_hash: vk_access_hash,
            artist: artist_formatted,
            artists: artists,
            image: image_data
          }.compact
        end

        def album
          @album ||= @args.album
        end
      end
    end
  end
end
