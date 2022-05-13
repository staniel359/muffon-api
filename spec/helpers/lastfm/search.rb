module Helpers
  module LastFM
    module Search
      class << self
        def albums_data
          {:search=>{:albums=>[{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:name=>"lastfm"}}], :source=>{:name=>"lastfm"}, :title=>"Nocturne - mu-sique.com"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:name=>"lastfm"}}], :source=>{:name=>"lastfm"}, :title=>"Nocturne [+CD] Disc 1"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:name=>"lastfm"}}], :source=>{:name=>"lastfm"}, :title=>"Nocturne (2012)"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:name=>"lastfm"}}], :source=>{:name=>"lastfm"}, :title=>"Wild Nothing - Nocturne (2012)"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:name=>"lastfm"}}], :source=>{:name=>"lastfm"}, :title=>"2012 - Nocturne"}], :page=>2, :total_pages=>20}}
        end

        def artists_data
          {:search=>{:artists=>[{:name=>"Beach Fossils, Wild Nothing", :source=>{:name=>"lastfm"}}, {:name=>"Wild Nothing /", :source=>{:name=>"lastfm"}}, {:name=>"Beach Fossils & Wild Nothing", :source=>{:name=>"lastfm"}}, {:name=>"??? ??(Wild Nothing)", :source=>{:name=>"lastfm"}}, {:name=>"와일드 낫띵(Wild Nothing)", :source=>{:name=>"lastfm"}}], :page=>2, :total_pages=>40}}
        end

        def tags_data
          {:search=>{:page=>2, :tags=>[{:name=>"noise pop"}, {:name=>"pop rock"}, {:name=>"chamber pop"}, {:name=>"psychedelic pop"}, {:name=>"post-pop"}, {:name=>"jangle pop"}, {:name=>"dance-pop"}, {:name=>"power pop"}, {:name=>"baroque pop"}, {:name=>"teen pop"}], :total_pages=>10}}
        end

        def tracks_data
          {:search=>{:page=>2, :total_pages=>39, :tracks=>[{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:name=>"lastfm"}}], :player_id=>"1", :source=>{:name=>"lastfm"}, :title=>"Gemini - Chinatown"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:name=>"lastfm"}}], :player_id=>"1", :source=>{:name=>"lastfm"}, :title=>"Chinatown (Live from Brooklyn Steel)"}, {:artist=>{:name=>"Wild_Nothing"}, :artists=>[{:name=>"Wild_Nothing", :source=>{:name=>"lastfm"}}], :player_id=>"1", :source=>{:name=>"lastfm"}, :title=>"Chinatown"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:name=>"lastfm"}}], :player_id=>"1", :source=>{:name=>"lastfm"}, :title=>"10 Chinatown"}, {:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:name=>"lastfm"}}], :player_id=>"1", :source=>{:name=>"lastfm"}, :title=>"\"Chinatown\" from the album Gemini (Captured Tracks) - Wild N"}]}}
        end
      end
    end
  end
end
