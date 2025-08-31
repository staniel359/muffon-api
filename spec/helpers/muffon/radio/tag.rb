module Spec
  module Helpers
    module Muffon
      module Radio
        module Tag
          def muffon_radio_tag_artists_data
            {:radio=>{:track=>{:artist=>{:name=>"a-ha"}, :artists=>[{:name=>"a-ha"}], :player_id=>"1", :source=>{:links=>{:original=>"https://www.last.fm/music/a-ha/_/Take+on+Me"}, :name=>"lastfm"}, :title=>"Take on Me"}}}
          end

          def muffon_radio_tag_tracks_data
            {:radio=>{:track=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing"}], :player_id=>"1", :source=>{:links=>{:original=>"https://www.last.fm/music/Wild+Nothing/_/Drifter"}, :name=>"lastfm"}, :title=>"Drifter"}}}
          end
        end
      end
    end
  end
end
