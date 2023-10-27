module Helpers
  module MusixMatch
    module Search
      class << self
        def artists_data
          {:search=>{:artists=>[{:name=>"No Te Va Gustar", :source=>{:id=>49783, :links=>{:original=>"https://www.musixmatch.com/artist/49783"}, :name=>"musixmatch"}}, {:name=>"Alphaville", :source=>{:id=>1370, :links=>{:original=>"https://www.musixmatch.com/artist/1370"}, :name=>"musixmatch"}}, {:name=>"Selena", :source=>{:id=>52918551, :links=>{:original=>"https://www.musixmatch.com/artist/52918551"}, :name=>"musixmatch"}}, {:name=>"New Found Glory", :source=>{:id=>11846, :links=>{:original=>"https://www.musixmatch.com/artist/11846"}, :name=>"musixmatch"}}], :page=>2, :total_pages=>2000}}
        end

        def tracks_data
          {:search=>{:page=>2, :total_pages=>2000, :tracks=>[{:album=>{:source=>{:id=>57610143, :name=>"musixmatch"}, :title=>"What Was I Made For? [From The Motion Picture \"Barbie\"]"}, :artist=>{:name=>"Billie Eilish"}, :artists=>[{:name=>"Billie Eilish", :source=>{:id=>29247465, :name=>"musixmatch"}}], :player_id=>"1-161074192", :source=>{:id=>161074192, :links=>{:original=>"https://www.musixmatch.com/lyrics/29247465/161074192"}, :name=>"musixmatch"}, :title=>"What Was I Made For? [From The Motion Picture \"Barbie\"]"}, {:album=>{:source=>{:id=>57193843, :name=>"musixmatch"}, :title=>"Dance The Night (From Barbie The Album)"}, :artist=>{:name=>"Dua Lipa"}, :artists=>[{:name=>"Dua Lipa", :source=>{:id=>33491593, :name=>"musixmatch"}}], :player_id=>"1-159305876", :source=>{:id=>159305876, :links=>{:original=>"https://www.musixmatch.com/lyrics/33491593/159305876"}, :name=>"musixmatch"}, :title=>"Dance The Night (From Barbie The Album)"}, {:album=>{:source=>{:id=>34234172, :name=>"musixmatch"}, :title=>"Lover"}, :artist=>{:name=>"Taylor Swift"}, :artists=>[{:name=>"Taylor Swift", :source=>{:id=>259675, :name=>"musixmatch"}}], :player_id=>"1-99297749", :source=>{:id=>99297749, :links=>{:original=>"https://www.musixmatch.com/lyrics/259675/99297749"}, :name=>"musixmatch"}, :title=>"Cruel Summer"}, {:album=>{:source=>{:id=>56318435, :name=>"musixmatch"}, :title=>"Endless Summer Vacation"}, :artist=>{:name=>"Miley Cyrus"}, :artists=>[{:name=>"Miley Cyrus", :source=>{:id=>224210, :name=>"musixmatch"}}], :player_id=>"1-157191703", :source=>{:id=>157191703, :links=>{:original=>"https://www.musixmatch.com/lyrics/224210/157191703"}, :name=>"musixmatch"}, :title=>"Flowers"}, {:album=>{:source=>{:id=>57431286, :name=>"musixmatch"}, :title=>"a Gift & a Curse"}, :artist=>{:name=>"Gunna"}, :artists=>[{:name=>"Gunna", :source=>{:id=>55813094, :name=>"musixmatch"}}], :player_id=>"1-160446433", :source=>{:id=>160446433, :links=>{:original=>"https://www.musixmatch.com/lyrics/55813094/160446433"}, :name=>"musixmatch"}, :title=>"fukumean"}]}}
        end
      end
    end
  end
end
