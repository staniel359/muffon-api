module Helpers
  module LastFM
    module Search
      class << self
        def albums_data
          {:search=>{:albums=>[{:artists=>[{:name=>"Wild Nothing"}], :source_id=>"lastfm", :title=>"Nocturne - mu-sique.com"}, {:artists=>[{:name=>"Wild Nothing"}], :source_id=>"lastfm", :title=>"Nocturne [+CD] Disc 1"}, {:artists=>[{:name=>"Wild Nothing"}], :source_id=>"lastfm", :title=>"Nocturne (2012)"}, {:artists=>[{:name=>"Wild Nothing"}], :source_id=>"lastfm", :title=>"Wild Nothing - Nocturne (2012)"}, {:artists=>[{:name=>"Wild Nothing"}], :source_id=>"lastfm", :title=>"2012 - Nocturne"}], :page=>2, :total_pages=>20}}
        end

        def artists_data
          {:search=>{:artists=>[{:name=>"Beach Fossils, Wild Nothing"}, {:name=>"Wild Nothing /"}, {:name=>"Beach Fossils & Wild Nothing"}, {:name=>"??? ??(Wild Nothing)"}, {:name=>"와일드 낫띵(Wild Nothing)"}], :page=>2, :total_pages=>40}}
        end

        def tags_data
          {:search=>{:page=>2, :tags=>[{:id=>1, :name=>"noise pop"}, {:id=>1, :name=>"pop rock"}, {:id=>1, :name=>"chamber pop"}, {:id=>1, :name=>"psychedelic pop"}, {:id=>1, :name=>"post-pop"}, {:id=>1, :name=>"jangle pop"}, {:id=>1, :name=>"dance-pop"}, {:id=>1, :name=>"power pop"}, {:id=>1, :name=>"baroque pop"}, {:id=>1, :name=>"teen pop"}], :total_pages=>10}}
        end

        def tracks_data
          {:search=>{:page=>2, :total_pages=>39, :tracks=>[{:artists=>[{:name=>"Wild Nothing"}], :player_id=>"1", :source_id=>"lastfm", :title=>"Gemini - Chinatown"}, {:artists=>[{:name=>"Wild Nothing"}], :player_id=>"1", :source_id=>"lastfm", :title=>"Chinatown (Live from Brooklyn Steel)"}, {:artists=>[{:name=>"Wild_Nothing"}], :player_id=>"1", :source_id=>"lastfm", :title=>"Chinatown"}, {:artists=>[{:name=>"Wild Nothing"}], :player_id=>"1", :source_id=>"lastfm", :title=>"10 Chinatown"}, {:artists=>[{:name=>"Wild Nothing"}], :player_id=>"1", :source_id=>"lastfm", :title=>"\"Chinatown\" from the album Gemini (Captured Tracks) - Wild N"}]}}
        end
      end
    end
  end
end
