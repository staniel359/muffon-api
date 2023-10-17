module Helpers
  module MusixMatch
    module Track
      class << self
        def albums_data
          {:track=>{:albums=>[{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>542702, :name=>"musixmatch"}}], :release_date=>"2010-05-25", :source=>{:id=>21497986, :links=>{:original=>"https://www.musixmatch.com/album/542702/21497986"}, :name=>"musixmatch"}, :title=>"Gemini"}], :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>542702, :name=>"musixmatch"}}], :player_id=>"1", :source=>{:id=>6717709, :links=>{:original=>"https://www.musixmatch.com/lyrics/542702/6717709"}, :name=>"musixmatch"}, :title=>"Chinatown"}}
        end

        def info_data
          {:track=>{:album=>{:source=>{:id=>21497986, :name=>"musixmatch"}, :title=>"Gemini"}, :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>542702, :name=>"musixmatch"}}], :lyrics=>"Innocent love\nI need someone, somewhere\nI need some way to come down\nI need some way to make things right\n\nInnocent love\nI need someone, somewhere\nI need some way to come down\nI need some way to ma...", :player_id=>"1", :source=>{:id=>6717709, :links=>{:original=>"https://www.musixmatch.com/lyrics/542702/6717709"}, :name=>"musixmatch"}, :tags=>[{:name=>"Pop"}], :title=>"Chinatown"}}
        end

        def links_data
          {:track=>{:links=>{:original=>"https://www.musixmatch.com/lyrics/542702/6717709"}}}
        end

        def lyrics_data
          {:track=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>542702, :name=>"musixmatch"}}], :lyrics=>["Innocent love\nI need someone, somewhere\nI need some way to come down\nI need some way to make things right\n\nInnocent love\nI need someone, somewhere\nI need some way to come down\nI need some way to make things right\n\nWe′re not happy til we're running away\nClouds in your eyes\nWe′re nothing but the foggiest day\n\nOne of a kind\nI need to keep you here\nI need to picture you still\nI need to clear the fog\n\nOne of a kind\nI need to keep you here\nI need to picture you still\nI need to clear the fog\n\nWe're not happy til we're running away\nClouds in your eyes\nWe′re nothing but the foggiest day\nClouds in your eyes\nWe′re not happy til we're running away\nClouds in your eyes\nWe′re nothing but the foggiest day\n"], :player_id=>"1", :source=>{:id=>6717709, :links=>{:original=>"https://www.musixmatch.com/lyrics/542702/6717709"}, :name=>"musixmatch"}, :title=>"Chinatown"}}
        end

        def tags_data
          {:track=>{:tags=>[{:name=>"Pop"}]}}
        end
      end
    end
  end
end
