module Helpers
  module LastFM
    module Search
      class << self
        def albums_data
          {:search=>{:albums=>[{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing"}], :source_id=>"lastfm", :title=>"Nocturne [+CD] Disc 1"}, {:artist=>{:name=>"Wild Nothing - Nocturne"}, :artists=>[{:name=>"Wild Nothing - Nocturne"}], :source_id=>"lastfm", :title=>"Nocturne"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing"}], :source_id=>"lastfm", :title=>"Nocturne (2012)"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing"}], :source_id=>"lastfm", :title=>"Wild Nothing - Nocturne (2012)"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing"}], :source_id=>"lastfm", :title=>"2012 - Nocturne"}], :page=>2, :total_pages=>19}}
        end

        def artists_data
          {:search=>{:artists=>[{:name=>"Wild Nothing /"}, {:name=>"??? ??(Wild Nothing)"}, {:name=>"와일드 낫띵(Wild Nothing)"}, {:name=>"Beach Fossils, Wild Nothing"}, {:name=>"Beach Fossils & Wild Nothing"}], :page=>2, :total_pages=>40}}
        end

        def tags_data
          {:search=>{:page=>2, :tags=>[{:id=>1, :name=>"ambient pop"}, {:id=>1, :name=>"teen pop"}, {:id=>1, :name=>"80s pop"}, {:id=>1, :name=>"dark pop"}, {:id=>1, :name=>"death pop"}, {:id=>1, :name=>"gothic pop"}, {:id=>1, :name=>"emo-pop"}, {:id=>1, :name=>"doom pop"}, {:id=>1, :name=>"weed pop"}, {:id=>1, :name=>"hk-pop"}], :total_pages=>10}}
        end

        def tracks_data
          {:search=>{:page=>2, :total_pages=>38, :tracks=>[{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing"}], :player_id=>"1", :source_id=>"lastfm", :title=>"Gemini - Chinatown"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing"}], :player_id=>"1", :source_id=>"lastfm", :title=>"Chinatown (Live from Brooklyn Steel)"}, {:artist=>{:name=>"Wild_Nothing"}, :artists=>[{:name=>"Wild_Nothing"}], :player_id=>"1", :source_id=>"lastfm", :title=>"Chinatown"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing"}], :player_id=>"1", :source_id=>"lastfm", :title=>"10 Chinatown"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing"}], :player_id=>"1", :source_id=>"lastfm", :title=>"\"Chinatown\" from the album Gemini (Captured Tracks) - Wild N"}]}}
        end
      end
    end
  end
end
