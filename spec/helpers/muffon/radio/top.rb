module Helpers
  module Muffon
    module Radio
      module Top
        class << self
          def artists_data
            {:radio=>{:track=>{:artist=>{:name=>"Taylor Swift"}, :artists=>[{:name=>"Taylor Swift"}], :player_id=>"1", :source=>{:links=>{:original=>"https://www.last.fm/music/Taylor+Swift/_/Blank+Space"}, :name=>"lastfm"}, :title=>"Blank Space"}}}
          end

          def tracks_data
            {:radio=>{:track=>{:artist=>{:name=>"Jimin"}, :artists=>[{:name=>"Jimin"}], :player_id=>"1", :source=>{:links=>{:original=>"https://www.last.fm/music/Jimin/_/Like+Crazy"}, :name=>"lastfm"}, :title=>"Like Crazy"}}}
          end
        end
      end
    end
  end
end
