module Spec
  module Helpers
    module Muffon
      module Radio
        module Tag
          def muffon_radio_tag_artists_data
            {radio: {track: {artist: {name: "a-ha"}, artists: [{name: "a-ha", source: {name: "lastfm"}}], listeners_count: 0, player_id: "1", source: {links: {original: "https://www.last.fm/music/a-ha/_/Take+on+Me"}, name: "lastfm"}, title: "Take on Me"}}}
          end

          def muffon_radio_tag_tracks_data
            {radio: {track: {artist: {image: {extrasmall: "https://lastfm.freetls.fastly.net/i/u/60x60/85382d1d98294ee85c063271310c048d", large: "https://lastfm.freetls.fastly.net/i/u/600x600/85382d1d98294ee85c063271310c048d", medium: "https://lastfm.freetls.fastly.net/i/u/300x300/85382d1d98294ee85c063271310c048d", original: "https://lastfm.freetls.fastly.net/i/u/85382d1d98294ee85c063271310c048d", small: "https://lastfm.freetls.fastly.net/i/u/174s/85382d1d98294ee85c063271310c048d"}, name: "Wild Nothing"}, artists: [{name: "Wild Nothing", source: {name: "lastfm"}}], listeners_count: 0, player_id: "1", source: {links: {original: "https://www.last.fm/music/Wild+Nothing/_/Drifter"}, name: "lastfm"}, title: "Drifter"}}}
          end
        end
      end
    end
  end
end
