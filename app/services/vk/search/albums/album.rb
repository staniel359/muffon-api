module VK
  module Search
    class Albums
      class Album < VK::Search::Albums
        def call
          album? ? album_data : vk_id_data
        end

        private

        def album?
          @args.album['type'] == 'playlist'
        end

        def album_data
          {
            title: CGI.unescapeHTML(@args.album['title']),
            artist: CGI.unescapeHTML(artist_name(@args.album)),
            vk_id: @args.album['id'],
            vk_owner_id: @args.album['ownerId'],
            vk_access_hash: @args.album['accessHash']
          }
        end

        def vk_id_data
          { vk_id: @args.album['id'] }
        end
      end
    end
  end
end
