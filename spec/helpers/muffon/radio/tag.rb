module Helpers
  module Muffon
    module Radio
      module Tag
        class << self
          def artists_data
            {:radio=>{:track=>{:artist=>{:name=>"Kate Bush"}, :artists=>[{:name=>"Kate Bush"}], :listeners_count=>739995, :player_id=>"1", :source=>{:name=>"lastfm"}, :title=>"Running Up That Hill (A Deal With God)"}}}
          end

          def tracks_data
            {:radio=>{:track=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:name=>"lastfm"}}], :player_id=>"1", :source=>{:name=>"lastfm"}, :title=>"My Angel Lonely"}}}
          end
        end
      end
    end
  end
end
