module Spec
  module Helpers
    module Muffon
      module Radio
        module Artist
          def muffon_radio_artist_similar_data
            {radio: {track: {artist: {name: "Craft Spells"}, artists: [{name: "Craft Spells", source: {name: "lastfm"}}], listeners_count: 0, player_id: "1", source: {links: {original: "https://www.last.fm/music/Craft+Spells/_/After+the+Moment"}, name: "lastfm"}, title: "After the Moment"}}}
          end

          def muffon_radio_artist_tracks_data
            {radio: {track: {artist: {image: {extrasmall: "https://lastfm.freetls.fastly.net/i/u/60x60/85382d1d98294ee85c063271310c048d", large: "https://lastfm.freetls.fastly.net/i/u/600x600/85382d1d98294ee85c063271310c048d", medium: "https://lastfm.freetls.fastly.net/i/u/300x300/85382d1d98294ee85c063271310c048d", original: "https://lastfm.freetls.fastly.net/i/u/85382d1d98294ee85c063271310c048d", small: "https://lastfm.freetls.fastly.net/i/u/174s/85382d1d98294ee85c063271310c048d"}, name: "Wild Nothing"}, artists: [{name: "Wild Nothing", source: {name: "lastfm"}}], listeners_count: 0, player_id: "1", source: {links: {original: "https://www.last.fm/music/Wild+Nothing/_/Chinatown"}, name: "lastfm"}, title: "Chinatown"}}}
          end
        end
      end
    end
  end
end
