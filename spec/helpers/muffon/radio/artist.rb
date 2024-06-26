module Helpers
  module Muffon
    module Radio
      module Artist
        class << self
          def similar_data
            {:radio=>{:track=>{:artist=>{:name=>"Craft Spells"}, :artists=>[{:name=>"Craft Spells"}], :player_id=>"1", :source=>{:links=>{:original=>"https://www.last.fm/music/Craft+Spells/_/After+the+Moment"}, :name=>"lastfm"}, :title=>"After the Moment"}}}
          end

          def tracks_data
            {:radio=>{:track=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing"}], :player_id=>"1", :source=>{:links=>{:original=>"https://www.last.fm/music/Wild+Nothing/_/Chinatown"}, :name=>"lastfm"}, :title=>"Chinatown"}}}
          end
        end
      end
    end
  end
end
