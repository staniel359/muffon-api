module Helpers
  module LastFM
    module Top
      class << self
        def artists_data
          {:top=>{:artists=>["The Weeknd", "Lady Gaga", "Kanye West", "Taylor Swift", "Billie Eilish", "Drake", "Dua Lipa", "Ariana Grande", "Kendrick Lamar", "Rihanna"], :page=>1}}
        end

        def tags_data
          {:top=>{:tags=>["rock", "electronic", "seen live", "alternative", "indie", "pop", "female vocalists", "metal", "alternative rock", "jazz"]}}
        end

        def tracks_data
          {:top=>{:page=>1, :tracks=>[{:artist=>"Cardi B", :title=>"wAp (fEAt. mEgAn thEe stAllIOn)"}, {:artist=>"The Weeknd", :title=>"Blinding Lights"}, {:artist=>"Harry Styles", :title=>"Watermelon Sugar"}, {:artist=>"BTS", :title=>"Dynamite"}, {:artist=>"Miley Cyrus", :title=>"Midnight Sky"}, {:artist=>"BLACKPINK", :title=>"Ice Cream (with Selena Gomez)"}, {:artist=>"BLACKPINK", :title=>"How you like that"}, {:artist=>"Dua Lipa", :title=>"doN'T StArT nOw"}, {:artist=>"Lady Gaga", :title=>"rAIn oN mE (with aRIaNa gRAndE)"}, {:artist=>"Tame Impala", :title=>"The Less I Know the Better"}]}}
        end
      end
    end
  end
end
