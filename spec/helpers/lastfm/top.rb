module Helpers
  module LastFM
    module Top
      class << self
        def artists_data
          {:top=>{:artists=>[{:listeners_count=>1801491, :name=>"Kendrick Lamar"}, {:listeners_count=>4905514, :name=>"Rihanna"}, {:listeners_count=>721745, :name=>"Harry Styles"}, {:listeners_count=>5683195, :name=>"Coldplay"}, {:listeners_count=>1460198, :name=>"Tame Impala"}, {:listeners_count=>1538498, :name=>"Frank Ocean"}, {:listeners_count=>978775, :name=>"Post Malone"}, {:listeners_count=>4334172, :name=>"Queen"}, {:listeners_count=>2214187, :name=>"Lana Del Rey"}, {:listeners_count=>3970131, :name=>"The Beatles"}], :page=>2, :total_pages=>385870}}
        end

        def tags_data
          {:top=>{:page=>2, :tags=>[{:name=>"classic rock", :taggers_count=>136668}, {:name=>"ambient", :taggers_count=>144629}, {:name=>"experimental", :taggers_count=>139662}, {:name=>"folk", :taggers_count=>147769}, {:name=>"punk", :taggers_count=>142248}, {:name=>"indie rock", :taggers_count=>133696}, {:name=>"Hip-Hop", :taggers_count=>127157}, {:name=>"hard rock", :taggers_count=>114003}, {:name=>"instrumental", :taggers_count=>123387}, {:name=>"black metal", :taggers_count=>61820}], :total_pages=>100}}
        end

        def tracks_data
          {:top=>{:page=>2, :total_pages=>2851672, :tracks=>[{:artist=>"Taylor Swift", :listeners_count=>116755, :title=>"champagne problems"}, {:artist=>"Taylor Swift", :listeners_count=>113524, :title=>"gold rush"}, {:artist=>"Harry Styles", :listeners_count=>390344, :title=>"Watermelon Sugar"}, {:artist=>"Dua Lipa", :listeners_count=>437049, :title=>"doN'T StArT nOw"}, {:artist=>"Taylor Swift", :listeners_count=>108608, :title=>"no body, no crime (feat. HAIM)"}, {:artist=>"Taylor Swift", :listeners_count=>105033, :title=>"tolerate it"}, {:artist=>"Taylor Swift", :listeners_count=>103680, :title=>"‘tis the damn season"}, {:artist=>"BTS", :listeners_count=>99314, :title=>"Life Goes On"}, {:artist=>"Taylor Swift", :listeners_count=>253926, :title=>"carDIGan"}, {:artist=>"Wham!", :listeners_count=>728398, :title=>"Last Christmas"}]}}
        end
      end
    end
  end
end
