module Spec
  module Helpers
    module Muffon
      module Radio
        module Top
          def muffon_radio_top_artists_data
            {:radio=>{track: {artist: {name: "Kendrick Lamar"}, artists: [{name: "Kendrick Lamar"}], player_id: "1", source: {links: {original: "https://www.last.fm/music/Kendrick+Lamar/_/HUMBLE."}, name: "lastfm"}, title: "HUMBLE."}}}
          end

          def muffon_radio_top_tracks_data
            {:radio=>{track: {artist: {name: "Sabrina Carpenter"}, artists: [{name: "Sabrina Carpenter"}], player_id: "1", source: {links: {original: "https://www.last.fm/music/Sabrina+Carpenter/_/Manchild"}, name: "lastfm"}, title: "Manchild"}}}
          end
        end
      end
    end
  end
end
