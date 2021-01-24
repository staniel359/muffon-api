module Helpers
  module LastFM
    module Top
      class << self
        def artists_data
          {:top=>{:artists=>[{:listeners_count=>970232, :name=>"Dua Lipa"}, {:listeners_count=>4230746, :name=>"Lady Gaga"}, {:listeners_count=>3774491, :name=>"Drake"}, {:listeners_count=>2253624, :name=>"Lana Del Rey"}, {:listeners_count=>2420892, :name=>"Miley Cyrus"}], :page=>2, :total_pages=>200}}
        end

        def tags_data
          {:top=>{:page=>2, :tags=>[{:name=>"pop", :taggers_count=>226686}, {:name=>"female vocalists", :taggers_count=>167980}, {:name=>"metal", :taggers_count=>155907}, {:name=>"alternative rock", :taggers_count=>167140}, {:name=>"jazz", :taggers_count=>146859}], :total_pages=>200}}
        end

        def tracks_data
          {:top=>{:page=>2, :total_pages=>200, :tracks=>[{:artist=>{:name=>"Taylor Swift"}, :listeners_count=>196158, :title=>"willow"}, {:artist=>{:name=>"Cardi B"}, :listeners_count=>357501, :title=>"wAp (fEAt. mEgAn thEe stAllIOn)"}, {:artist=>{:name=>"Dua Lipa"}, :listeners_count=>465136, :title=>"doN'T StArT nOw"}, {:artist=>{:name=>"Harry Styles"}, :listeners_count=>419205, :title=>"Watermelon Sugar"}, {:artist=>{:name=>"Billie Eilish"}, :listeners_count=>226145, :title=>"therefore i am"}]}}
        end
      end
    end
  end
end
