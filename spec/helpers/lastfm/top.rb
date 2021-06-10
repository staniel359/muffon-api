module Helpers
  module LastFM
    module Top
      class << self
        def artists_data
          {:top=>{:artists=>[{:name=>"Ariana Grande"}, {:name=>"Taylor Swift"}, {:name=>"Drake"}, {:name=>"Olivia Rodrigo"}, {:name=>"Kendrick Lamar"}], :page=>2, :total_pages=>2000}}
        end

        def tags_data
          {:top=>{:page=>2, :tags=>[{:name=>"pop", :taggers_count=>227450}, {:name=>"female vocalists", :taggers_count=>168280}, {:name=>"metal", :taggers_count=>156113}, {:name=>"alternative rock", :taggers_count=>167342}, {:name=>"jazz", :taggers_count=>147336}], :total_pages=>200}}
        end

        def tracks_data
          {:top=>{:page=>2, :total_pages=>2000, :tracks=>[{:artist=>{:name=>"Billie Eilish"}, :artists=>[{:name=>"Billie Eilish"}], :listeners_count=>191247, :title=>"Your Power", :player_id=>"1"}, {:artist=>{:name=>"The Weeknd"}, :artists=>[{:name=>"The Weeknd"}], :listeners_count=>739551, :title=>"Blinding Lights", :player_id=>"1"}, {:artist=>{:name=>"Olivia Rodrigo"}, :artists=>[{:name=>"Olivia Rodrigo"}], :listeners_count=>156179, :title=>"brutal", :player_id=>"1"}, {:artist=>{:name=>"Dua Lipa"}, :artists=>[{:name=>"Dua Lipa"}], :listeners_count=>331525, :title=>"Levitating (feat. DaBaby)", :player_id=>"1"}, {:artist=>{:name=>"Olivia Rodrigo"}, :artists=>[{:name=>"Olivia Rodrigo"}], :listeners_count=>141154, :title=>"traitor", :player_id=>"1"}]}}
        end
      end
    end
  end
end
