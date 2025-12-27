module Spec
  module Helpers
    module LastFM
      module User
        module Playlists
          def lastfm_user_playlists_data
            {user:{nickname: "cornwell_93", page: 2, playlists: [{source: {id: 12688645, links: {original: "https://www.last.fm/user/cornwell_93/playlists/12688645"}, name: "lastfm"}, title: "My New Playlist", tracks_count: 0}, {source: {id: 12688644, links: {original: "https://www.last.fm/user/cornwell_93/playlists/12688644"}, name: "lastfm"}, title: "My New Playlist", tracks_count: 0}, {source: {id: 12688642, links: {original: "https://www.last.fm/user/cornwell_93/playlists/12688642"}, name: "lastfm"}, title: "My New Playlist", tracks_count: 0}], total_items: 8, total_pages: 2}}
          end
        end
      end
    end
  end
end
