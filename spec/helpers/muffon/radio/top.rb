module Helpers
  module Muffon
    module Radio
      module Top
        class << self
          def artists_data
            {:radio=>{:track=>{:artist=>{:name=>"BTS"}, :artists=>[{:name=>"BTS"}], :player_id=>"1", :source=>{:links=>{:original=>"https://www.last.fm/music/BTS/_/Dynamite"}, :name=>"lastfm"}, :title=>"Dynamite"}}}
          end

          def tracks_data
            {:radio=>{:track=>{:artist=>{:name=>"j-hope"}, :artists=>[{:name=>"j-hope"}], :player_id=>"1", :source=>{:links=>{:original=>"https://www.last.fm/music/j-hope/_/MORE"}, :name=>"lastfm"}, :title=>"MORE"}}}
          end
        end
      end
    end
  end
end
