module Spec
  module Helpers
    module Audius
      module Artist
        def audius_artist_albums_data
          {artist: {albums: [{artist: {name: "TreMarkStar"}, artists: [{name: "TreMarkStar", source: {id: "Y5AmdW", name: "audius"}}], image: {extrasmall: "https://creatornode2.audius.co/content/01K2MMVJG8DDDMKXPKJZC2XT9Y/150x150.jpg", large: "https://creatornode2.audius.co/content/01K2MMVJG8DDDMKXPKJZC2XT9Y/480x480.jpg", medium: "https://creatornode2.audius.co/content/01K2MMVJG8DDDMKXPKJZC2XT9Y/480x480.jpg", original: "https://creatornode2.audius.co/content/01K2MMVJG8DDDMKXPKJZC2XT9Y/1000x1000.jpg", small: "https://creatornode2.audius.co/content/01K2MMVJG8DDDMKXPKJZC2XT9Y/150x150.jpg"}, listeners_count: 0, release_date: "2025-08-14", source: {id: 558158300, links: {original: "https://audius.co/TreMarkStar/album/lovelostlive-2-tre-mark-star"}, name: "audius"}, title: "LOVE.LOST.LIVE 2 - Tre Mark Star"}], name: "TreMarkStar", page: 2, total_pages: 3}}
        end

        def audius_artist_info_data
          {artist:{albums_count: 3, name: "TreMarkStar"}}
        end
      end
    end
  end
end
