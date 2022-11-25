module Helpers
  module Bandcamp
    module Track
      class << self
        def description_data
          {:track=>{:description=>"From Jack Tatum: “There were a number of songs that were kicking when I was finishing Indigo and ‘Blue Wings’ was very nearly included. I had sent the album off to mastering, but the song didn't sit right with me and I decided, at the last possible moment, to leave it off the album. It's intentionally a very bittersweet sounding song. I asked Ben Talmi who did the string arrangements on ‘Shadow’ to help out with this very simple dissonant string part I was hearing in my head which is now my favorite element in the track. It's a song about walking through to the other side of crippling self-doubt with the help of someone you love. It's a reminder to myself not to let things spiral, hard as it may be at times.”"}}
        end

        def info_album_data
          {:track=>{:album=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :source=>{:artist_id=>2228040235, :id=>452973411, :name=>"bandcamp"}, :title=>"Indigo"}, :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :audio=>{:link=>"https://t4.bcbits.com/stream/210d5388506737316a14c2884cf27ca2/mp3-128/2723372494?p=0&ts=1669491929&t=ca0b63115ae0e3c6b05da12305fceb84de835a7e&token=1669491929_fe13ede65490947303116aac15739f60921d1044", :present=>true}, :duration=>221, :image=>{:extrasmall=>"https://f4.bcbits.com/img/a3221996752_42.jpg", :large=>"https://f4.bcbits.com/img/a3221996752_5.jpg", :medium=>"https://f4.bcbits.com/img/a3221996752_4.jpg", :original=>"https://f4.bcbits.com/img/a3221996752_10.jpg", :small=>"https://f4.bcbits.com/img/a3221996752_3.jpg"}, :player_id=>"1", :source=>{:artist_id=>2228040235, :id=>2723372494, :model=>"track", :name=>"bandcamp"}, :tags=>[{:name=>"Rock"}, {:name=>"indie"}, {:name=>"indie pop"}, {:name=>"Blacksburg"}], :title=>"Letting Go"}}
        end

        def info_description_data
          {:track=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :audio=>{:link=>"https://t4.bcbits.com/stream/e148a637678a280c923db13ea133ab73/mp3-128/1709958085?p=0&ts=1632423475&t=71de7c1a2fe2915850e480fcf2167c20e2f8b179&token=1632423475_16ecb6be4d66a6d489aaff72ccb602014700504d", :present=>true}, :description=>"From Jack Tatum: “There were a number of songs that were kicking when I was finishing Indigo and ‘Blue Wings’ was very nearly included. I had sent the album off to mastering, but the song didn't sit right with me and I decided, at the last possible moment, to leave it off the album. It's intentionally a very bittersweet sounding song. I asked Ben Talmi who did the string arrangements on ‘Shadow...", :duration=>225, :image=>{:extrasmall=>"https://f4.bcbits.com/img/a3861181658_42.jpg", :large=>"https://f4.bcbits.com/img/a3861181658_5.jpg", :medium=>"https://f4.bcbits.com/img/a3861181658_4.jpg", :original=>"https://f4.bcbits.com/img/a3861181658_10.jpg", :small=>"https://f4.bcbits.com/img/a3861181658_3.jpg"}, :player_id=>"1", :source=>{:artist_id=>2228040235, :id=>1709958085, :model=>"track", :name=>"bandcamp"}, :tags=>[{:name=>"Rock"}, {:name=>"indie"}, {:name=>"indie pop"}, {:name=>"Blacksburg"}], :title=>"Blue Wings", :with_more=>{:description=>true}}}
        end

        def tags_data
          {:track=>{:tags=>[{:name=>"Rock"}, {:name=>"indie"}, {:name=>"indie pop"}, {:name=>"Blacksburg"}]}}
        end
      end
    end
  end
end
