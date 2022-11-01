module Helpers
  module Deezer
    module Track
      class << self
        def info_data
          {:track=>{:album=>{:source=>{:id=>1063611, :name=>"deezer"}, :title=>"Hounds Of Love"}, :artist=>{:name=>"Kate Bush"}, :artists=>[{:name=>"Kate Bush", :source=>{:id=>1049, :name=>"deezer"}}], :audio=>{:link=>"test.mp3", :present=>true}, :duration=>"04:58", :duration_seconds=>298, :image=>{:extrasmall=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/50x50-000000-80-0-0.jpg", :large=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/600x600-000000-80-0-0.jpg", :medium=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/300x300-000000-80-0-0.jpg", :original=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/1000x1000-000000-80-0-0.jpg", :small=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/100x100-000000-80-0-0.jpg"}, :player_id=>"1", :release_date=>"2011-05-16", :source=>{:id=>11616579, :name=>"deezer"}, :title=>"Running Up That Hill (A Deal With God)"}}
        end
      end
    end
  end
end
