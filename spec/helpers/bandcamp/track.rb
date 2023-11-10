module Helpers
  module Bandcamp
    module Track
      class << self
        def albums_data
          {:track=>{:albums=>[{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :image=>{:extrasmall=>"https://f4.bcbits.com/img/a3221996752_42.jpg", :large=>"https://f4.bcbits.com/img/a3221996752_5.jpg", :medium=>"https://f4.bcbits.com/img/a3221996752_4.jpg", :original=>"https://f4.bcbits.com/img/a3221996752_10.jpg", :small=>"https://f4.bcbits.com/img/a3221996752_3.jpg"}, :release_date=>"2018-08-31", :source=>{:artist_id=>2228040235, :id=>452973411, :links=>{:original=>"https://wildnothingct.bandcamp.com/album/indigo", :streaming=>"https://album.link/b/452973411"}, :model=>"album", :name=>"bandcamp"}, :title=>"Indigo"}], :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :player_id=>"1-2723372494", :source=>{:artist_id=>2228040235, :id=>2723372494, :links=>{:original=>"https://wildnothingct.bandcamp.com/track/letting-go", :streaming=>"https://album.link/b/2723372494"}, :model=>"track", :name=>"bandcamp"}, :title=>"Letting Go"}}
        end

        def description_data
          {:track=>{:description=>"From Jack Tatum: “There were a number of songs that were kicking when I was finishing Indigo and ‘Blue Wings’ was very nearly included. I had sent the album off to mastering, but the song didn't sit right with me and I decided, at the last possible moment, to leave it off the album. It's intentionally a very bittersweet sounding song. I asked Ben Talmi who did the string arrangements on ‘Shadow’ to help out with this very simple dissonant string part I was hearing in my head which is now my favorite element in the track. It's a song about walking through to the other side of crippling self-doubt with the help of someone you love. It's a reminder to myself not to let things spiral, hard as it may be at times.”"}}
        end

        def info_album_data
          {:track=>{:album=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :source=>{:artist_id=>2228040235, :id=>452973411, :name=>"bandcamp"}, :title=>"Indigo"}, :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :audio=>{:link=>"https://t4.bcbits.com/stream/210d5388506737316a14c2884cf27ca2/mp3-128/2723372494?p=0&ts=1674898878&t=053c1cf7b2102434d72377d0248a5ed9c2697300&token=1674898878_e534d38275dc824f2e7b1e0f2a8f1cc96b95832f", :present=>true}, :duration=>221, :image=>{:extrasmall=>"https://f4.bcbits.com/img/a3221996752_42.jpg", :large=>"https://f4.bcbits.com/img/a3221996752_5.jpg", :medium=>"https://f4.bcbits.com/img/a3221996752_4.jpg", :original=>"https://f4.bcbits.com/img/a3221996752_10.jpg", :small=>"https://f4.bcbits.com/img/a3221996752_3.jpg"}, :player_id=>"1-2723372494", :source=>{:artist_id=>2228040235, :id=>2723372494, :links=>{:original=>"https://wildnothingct.bandcamp.com/track/letting-go", :streaming=>"https://album.link/b/2723372494"}, :model=>"track", :name=>"bandcamp"}, :tags=>[{:name=>"Rock"}, {:name=>"indie"}, {:name=>"indie pop"}, {:name=>"Blacksburg"}], :title=>"Letting Go"}}
        end

        def info_description_data
          {:track=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :audio=>{:link=>"https://t4.bcbits.com/stream/e148a637678a280c923db13ea133ab73/mp3-128/1709958085?p=0&ts=1674898883&t=4da29d19d194b612bda98cc5bf34f6662f5a6e6a&token=1674898883_70d6b6db0c3ff0c055bd7b2d6abfd2c13890c4ce", :present=>true}, :description=>"From Jack Tatum: “There were a number of songs that were kicking when I was finishing Indigo and ‘Blue Wings’ was very nearly included. I had sent the album off to mastering, but the song didn't sit right with me and I decided, at the last possible moment, to leave it off the album. It's intentionally a very bittersweet sounding song. I asked Ben Talmi who did the string arrangements on ‘Shadow...", :duration=>225, :image=>{:extrasmall=>"https://f4.bcbits.com/img/a3861181658_42.jpg", :large=>"https://f4.bcbits.com/img/a3861181658_5.jpg", :medium=>"https://f4.bcbits.com/img/a3861181658_4.jpg", :original=>"https://f4.bcbits.com/img/a3861181658_10.jpg", :small=>"https://f4.bcbits.com/img/a3861181658_3.jpg"}, :player_id=>"1-1709958085", :source=>{:artist_id=>2228040235, :id=>1709958085, :links=>{:original=>"https://wildnothingct.bandcamp.com/track/blue-wings", :streaming=>"https://album.link/b/1709958085"}, :model=>"track", :name=>"bandcamp"}, :tags=>[{:name=>"Rock"}, {:name=>"indie"}, {:name=>"indie pop"}, {:name=>"Blacksburg"}], :title=>"Blue Wings", :with_more=>{:description=>true}}}
        end

        def links_data
          {:track=>{:links=>{:original=>"https://wildnothingct.bandcamp.com/track/blue-wings", :streaming=>"https://album.link/b/1709958085"}}}
        end

        def tags_data
          {:track=>{:tags=>[{:name=>"Rock"}, {:name=>"indie"}, {:name=>"indie pop"}, {:name=>"Blacksburg"}]}}
        end
      end
    end
  end
end
