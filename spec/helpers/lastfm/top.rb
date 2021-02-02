module Helpers
  module LastFM
    module Top
      class << self
        def artists_data
          {:top=>{:artists=>[{:listeners_count=>976101, :name=>"Dua Lipa"}, {:listeners_count=>4236385, :name=>"Lady Gaga"}, {:listeners_count=>2259346, :name=>"Lana Del Rey"}, {:listeners_count=>3780497, :name=>"Drake"}, {:listeners_count=>1846443, :name=>"Kendrick Lamar"}], :page=>2, :total_pages=>200}}
        end

        def tags_data
          {:top=>{:page=>2, :tags=>[{:name=>"pop", :taggers_count=>226712}, {:name=>"female vocalists", :taggers_count=>167984}, {:name=>"metal", :taggers_count=>155922}, {:name=>"alternative rock", :taggers_count=>167151}, {:name=>"jazz", :taggers_count=>146870}], :total_pages=>200}}
        end

        def tracks_data
          {:top=>{:page=>2, :total_pages=>200, :tracks=>[{:artist=>{:name=>"Taylor Swift"}, :listeners_count=>201145, :title=>"willow"}, {:artist=>{:name=>"Cardi B"}, :listeners_count=>361221, :title=>"wAp (fEAt. mEgAn thEe stAllIOn)"}, {:artist=>{:name=>"Dua Lipa"}, :listeners_count=>468358, :title=>"doN'T StArT nOw"}, {:artist=>{:name=>"Billie Eilish"}, :listeners_count=>232143, :title=>"therefore i am"}, {:artist=>{:name=>"Lana Del Rey"}, :listeners_count=>99911, :title=>"Chemtrails Over the Country Club"}]}}
        end
      end
    end
  end
end
