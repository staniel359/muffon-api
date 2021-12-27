module Helpers
  module Deezer
    module Track
      class << self
        def info_data
          {:track=>{:album=>{:deezer_id=>1063611, :source_id=>"deezer", :title=>"Hounds Of Love"}, :artists=>[{:deezer_id=>1049, :name=>"Kate Bush"}], :audio=>{:link=>"http://localhost:4001/temp/audio/deezer/11616579.mp3", :present=>true, :source_id=>"deezer"}, :deezer_id=>11616579, :duration=>"04:58", :duration_seconds=>298, :image=>{:extrasmall=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/50x50-000000-80-0-0.jpg", :large=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/600x600-000000-80-0-0.jpg", :medium=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/300x300-000000-80-0-0.jpg", :original=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/1000x1000-000000-80-0-0.jpg", :small=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/100x100-000000-80-0-0.jpg"}, :player_id=>"1", :release_date=>"16 May 2011", :source_id=>"deezer", :title=>"Running Up That Hill (A Deal With God)"}}
        end
      end
    end
  end
end
