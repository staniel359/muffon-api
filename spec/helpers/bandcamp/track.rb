module Helpers
  module Bandcamp
    module Track
      class << self
        def albums_data
          {:track=>{:albums=>[{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :image=>{:extrasmall=>"https://f4.bcbits.com/img/a3221996752_42.jpg", :large=>"https://f4.bcbits.com/img/a3221996752_5.jpg", :medium=>"https://f4.bcbits.com/img/a3221996752_4.jpg", :original=>"https://f4.bcbits.com/img/a3221996752_10.jpg", :small=>"https://f4.bcbits.com/img/a3221996752_3.jpg"}, :release_date=>"2018-08-31", :source=>{:artist_id=>2228040235, :id=>452973411, :links=>{:original=>"https://wildnothingct.bandcamp.com/album/indigo", :streaming=>"https://album.link/b/452973411"}, :model=>"album", :name=>"bandcamp"}, :title=>"Indigo"}], :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :player_id=>"1", :source=>{:artist_id=>2228040235, :id=>2723372494, :links=>{:original=>"https://wildnothingct.bandcamp.com/track/letting-go", :streaming=>"https://album.link/b/2723372494"}, :model=>"track", :name=>"bandcamp"}, :title=>"Letting Go"}}
        end

        def description_data
          {:track=>{:description=>"From Jack Tatum: “There were a number of songs that were kicking when I was finishing Indigo and ‘Blue Wings’ was very nearly included. I had sent the album off to mastering, but the song didn't sit right with me and I decided, at the last possible moment, to leave it off the album. It's intentionally a very bittersweet sounding song. I asked Ben Talmi who did the string arrangements on ‘Shadow’ to help out with this very simple dissonant string part I was hearing in my head which is now my favorite element in the track. It's a song about walking through to the other side of crippling self-doubt with the help of someone you love. It's a reminder to myself not to let things spiral, hard as it may be at times.”"}}
        end

        def info_album_data
          {:track=>{:album=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :source=>{:artist_id=>2228040235, :id=>452973411, :name=>"bandcamp"}, :title=>"Indigo"}, :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :audio=>{:link=>"https://bandcamp.com/stream_redirect?enc=mp3-128&track_id=2723372494&ts=1674812458&t=9d26d9bdd482e661430d393224a68deb3d64dbf4", :present=>true}, :duration=>221, :image=>{:extrasmall=>"https://f4.bcbits.com/img/a3221996752_42.jpg", :large=>"https://f4.bcbits.com/img/a3221996752_5.jpg", :medium=>"https://f4.bcbits.com/img/a3221996752_4.jpg", :original=>"https://f4.bcbits.com/img/a3221996752_10.jpg", :small=>"https://f4.bcbits.com/img/a3221996752_3.jpg"}, :player_id=>"1", :source=>{:artist_id=>2228040235, :id=>2723372494, :links=>{:original=>"https://wildnothingct.bandcamp.com/track/letting-go", :streaming=>"https://album.link/b/2723372494"}, :model=>"track", :name=>"bandcamp"}, :tags=>[{:name=>"Rock"}, {:name=>"indie"}, {:name=>"indie pop"}, {:name=>"Blacksburg"}], :title=>"Letting Go"}}
        end

        def info_description_data
          {:track=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :audio=>{:link=>"https://bandcamp.com/stream_redirect?enc=mp3-128&track_id=1709958085&ts=1674812479&t=15cf6c7d9fe5f7d6d5790cba6d5358a417f983fb", :present=>true}, :description=>"From Jack Tatum: “There were a number of songs that were kicking when I was finishing Indigo and ‘Blue Wings’ was very nearly included. I had sent the album off to mastering, but the song didn't sit right with me and I decided, at the last possible moment, to leave it off the album. It's intentionally a very bittersweet sounding song. I asked Ben Talmi who did the string arrangements on ‘Shadow...", :duration=>225, :image=>{:extrasmall=>"https://f4.bcbits.com/img/a3861181658_42.jpg", :large=>"https://f4.bcbits.com/img/a3861181658_5.jpg", :medium=>"https://f4.bcbits.com/img/a3861181658_4.jpg", :original=>"https://f4.bcbits.com/img/a3861181658_10.jpg", :small=>"https://f4.bcbits.com/img/a3861181658_3.jpg"}, :player_id=>"1", :source=>{:artist_id=>2228040235, :id=>1709958085, :links=>{:original=>"https://wildnothingct.bandcamp.com/track/blue-wings", :streaming=>"https://album.link/b/1709958085"}, :model=>"track", :name=>"bandcamp"}, :tags=>[{:name=>"Rock"}, {:name=>"indie"}, {:name=>"indie pop"}, {:name=>"Blacksburg"}], :title=>"Blue Wings", :with_more=>{:description=>true}}}
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
