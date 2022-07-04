module Helpers
  module Muffon
    module Radio
      module Artist
        class << self
          def similar_data
            {:radio=>{:track=>{:artist=>{:name=>"Craft Spells"}, :artists=>[{:name=>"Craft Spells"}], :listeners_count=>191223, :player_id=>"1", :source=>{:name=>"lastfm"}, :title=>"After the Moment"}}}
          end

          def tracks_data
            {:radio=>{:track=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing"}], :listeners_count=>232391, :player_id=>"1", :source=>{:name=>"lastfm"}, :title=>"Chinatown"}}}
          end
        end
      end
    end
  end
end
