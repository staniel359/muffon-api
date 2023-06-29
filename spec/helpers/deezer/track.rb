module Helpers
  module Deezer
    module Track
      class << self
        def albums_data
          {:track=>{:albums=>[{:artist=>{:name=>"Kate Bush"}, :artists=>[{:name=>"Kate Bush", :source=>{:id=>1049, :name=>"deezer"}}], :image=>{:extrasmall=>"https://cdns-images.dzcdn.net/images/cover/22fedaf5d2b0ac8977b93bc1db7a4a2a/50x50-000000-80-0-0.jpg", :large=>"https://cdns-images.dzcdn.net/images/cover/22fedaf5d2b0ac8977b93bc1db7a4a2a/600x600-000000-80-0-0.jpg", :medium=>"https://cdns-images.dzcdn.net/images/cover/22fedaf5d2b0ac8977b93bc1db7a4a2a/300x300-000000-80-0-0.jpg", :original=>"https://cdns-images.dzcdn.net/images/cover/22fedaf5d2b0ac8977b93bc1db7a4a2a/1000x1000-000000-80-0-0.jpg", :small=>"https://cdns-images.dzcdn.net/images/cover/22fedaf5d2b0ac8977b93bc1db7a4a2a/100x100-000000-80-0-0.jpg"}, :release_date=>"1985-09-16", :source=>{:id=>413452427, :links=>{:original=>"https://www.deezer.com/album/413452427", :streaming=>"https://album.link/d/413452427"}, :name=>"deezer"}, :title=>"Hounds Of Love"}, {:artist=>{:name=>"Various Artists"}, :artists=>[{:name=>"Various Artists", :source=>{:id=>5080, :name=>"deezer"}}], :image=>{:extrasmall=>"https://cdns-images.dzcdn.net/images/cover/6aeffa2d5c980f71a2e3efc5303ec6df/50x50-000000-80-0-0.jpg", :large=>"https://cdns-images.dzcdn.net/images/cover/6aeffa2d5c980f71a2e3efc5303ec6df/600x600-000000-80-0-0.jpg", :medium=>"https://cdns-images.dzcdn.net/images/cover/6aeffa2d5c980f71a2e3efc5303ec6df/300x300-000000-80-0-0.jpg", :original=>"https://cdns-images.dzcdn.net/images/cover/6aeffa2d5c980f71a2e3efc5303ec6df/1000x1000-000000-80-0-0.jpg", :small=>"https://cdns-images.dzcdn.net/images/cover/6aeffa2d5c980f71a2e3efc5303ec6df/100x100-000000-80-0-0.jpg"}, :release_date=>"1992-09-19", :source=>{:id=>14030786, :links=>{:original=>"https://www.deezer.com/album/14030786", :streaming=>"https://album.link/d/14030786"}, :name=>"deezer"}, :title=>"Vuelve al Sábado Noche (Los 80 De Los 80)"}], :artist=>{:name=>"Kate Bush"}, :artists=>[{:name=>"Kate Bush", :source=>{:id=>1049, :name=>"deezer"}}], :player_id=>"1", :source=>{:id=>11616579, :links=>{:original=>"https://www.deezer.com/track/11616579", :streaming=>"https://song.link/d/11616579"}, :name=>"deezer"}, :title=>"Running Up That Hill (A Deal With God)"}}
        end

        def info_data
          {:track=>{:album=>{:source=>{:id=>1063611, :name=>"deezer"}, :title=>"Hounds Of Love"}, :artist=>{:name=>"Kate Bush"}, :artists=>[{:name=>"Kate Bush", :source=>{:id=>1049, :name=>"deezer"}}], :audio=>{:link=>"http://localhost:4001/files/audio/deezer/11616579.mp3", :present=>true}, :duration=>298, :image=>{:extrasmall=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/50x50-000000-80-0-0.jpg", :large=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/600x600-000000-80-0-0.jpg", :medium=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/300x300-000000-80-0-0.jpg", :original=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/1000x1000-000000-80-0-0.jpg", :small=>"https://cdns-images.dzcdn.net/images/cover/9f2d90023183010d657b01cba6bd5f19/100x100-000000-80-0-0.jpg"}, :player_id=>"1", :release_date=>"2011-05-16", :source=>{:id=>11616579, :links=>{:original=>"https://www.deezer.com/track/11616579", :streaming=>"https://song.link/d/11616579"}, :name=>"deezer"}, :title=>"Running Up That Hill (A Deal With God)"}}
        end

        def links_data
          {:track=>{:links=>{:original=>"https://www.deezer.com/track/11616579", :streaming=>"https://song.link/d/11616579"}}}
        end
      end
    end
  end
end
