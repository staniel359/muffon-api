module Helpers
  module Muffon
    module Radio
      module Tag
        class << self
          def artists_data
            {:radio=>{:track=>{:artist=>{:name=>"Depeche Mode"}, :artists=>[{:name=>"Depeche Mode"}], :listeners_count=>1075248, :player_id=>"1", :source_id=>"lastfm", :title=>"Enjoy the Silence"}}}
          end

          def tracks_data
            {:radio=>{:track=>{:artist=>{:name=>"Syo"}, :artists=>[{:name=>"Syo"}], :player_id=>"1", :source_id=>"lastfm", :title=>"Ching a Ling Heroes (Home Demo)"}}}
          end
        end
      end
    end
  end
end
