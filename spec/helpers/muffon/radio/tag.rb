module Helpers
  module Muffon
    module Radio
      module Tag
        class << self
          def artists_data
            {:radio=>{:track=>{:artist=>{:name=>"Depeche Mode"}, :artists=>[{:name=>"Depeche Mode"}], :listeners_count=>1075248, :player_id=>"1", :source=>{:name=>"lastfm"}, :title=>"Enjoy the Silence"}}}
          end

          def tracks_data
            {:radio=>{:track=>{:artist=>{:name=>"Syo"}, :artists=>[{:name=>"Syo", :source=>{:name=>"lastfm"}}], :player_id=>"1", :source=>{:name=>"lastfm"}, :title=>"Ching a Ling Heroes (Home Demo)"}}}
          end
        end
      end
    end
  end
end
