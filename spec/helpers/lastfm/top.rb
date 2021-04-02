module Helpers
  module LastFM
    module Top
      class << self
        def artists_data
          {:top=>{:artists=>[{:listeners_count=>2812681, :name=>"OutKast"}, {:listeners_count=>767464, :name=>"Troye Sivan"}, {:listeners_count=>4314639, :name=>"Muse"}, {:listeners_count=>452077, :name=>"Mitski"}, {:listeners_count=>452777, :name=>"Conan Gray"}], :page=>2, :total_pages=>20}}
        end

        def tags_data
          {:top=>{:page=>2, :tags=>[{:name=>"pop", :taggers_count=>227129}, {:name=>"female vocalists", :taggers_count=>168171}, {:name=>"metal", :taggers_count=>156025}, {:name=>"alternative rock", :taggers_count=>167255}, {:name=>"jazz", :taggers_count=>147224}], :total_pages=>40}}
        end

        def tracks_data
          {:top=>{:page=>2, :total_pages=>10, :tracks=>[{:artist=>{:name=>"Arctic Monkeys"}, :listeners_count=>1160832, :title=>"Fluorescent Adolescent"}, {:artist=>{:name=>"Grimes"}, :listeners_count=>646927, :title=>"Oblivion"}, {:artist=>{:name=>"Frank Ocean"}, :listeners_count=>256059, :title=>"In My Room"}, {:artist=>{:name=>"MGMT"}, :listeners_count=>1589515, :title=>"Electric Feel"}, {:artist=>{:name=>"Taylor Swift"}, :listeners_count=>206304, :title=>"sEvEN"}]}}
        end
      end
    end
  end
end
