module Helpers
  module MusixMatch
    module Track
      class << self
        def albums_data
          {:track=>{:albums=>[{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>542702, :name=>"musixmatch"}}], :release_date=>"2010-05-25", :source=>{:id=>21497986, :links=>{:original=>"https://www.musixmatch.com/album/542702/21497986"}, :name=>"musixmatch"}, :title=>"Gemini"}], :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>542702, :name=>"musixmatch"}}], :player_id=>"1-6717709", :source=>{:id=>6717709, :links=>{:original=>"https://www.musixmatch.com/lyrics/542702/6717709"}, :name=>"musixmatch"}, :title=>"Chinatown"}}
        end

        def info_data
          {:track=>{:album=>{:source=>{:id=>21497986, :name=>"musixmatch"}, :title=>"Gemini"}, :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>542702, :name=>"musixmatch"}}], :lyrics=>"Innocent love\nI need someone, somewhere\nI need some way to come down\nI need some way to make things right\n\nInnocent love\nI need someone, somewhere\nI need some way to come down\nI need some way to ma...", :player_id=>"1-6717709", :source=>{:id=>6717709, :links=>{:original=>"https://www.musixmatch.com/lyrics/542702/6717709"}, :name=>"musixmatch"}, :tags=>[{:name=>"Pop"}], :title=>"Chinatown"}}
        end

        def links_data
          {:track=>{:links=>{:original=>"https://www.musixmatch.com/lyrics/542702/6717709"}}}
        end

        def lyrics_data
          {:track=>{artist: {name: "Wild Nothing"}, artists: [{name: "Wild Nothing", source: {id: 542702, name: "musixmatch"}}], lyrics: ["[Verse]\n", "Innocent love\n", "I need someone, somewhere\n", "I need some way to come down\n", "I need some way to make things right\n", "Innocent love\n", "I need someone, somewhere\n", "I need some way to come down\n", "I need some way to make things right\n", "\n[Chorus]\n", "We're not happy til we're running away\n", "Clouds in your eyes\n", "We're nothing but the foggiest day\n", "\n[Verse]\n", "One of a kind\n", "I need to keep you here\n", "I need to picture you still\n", "I need to clear the fog\n", "One of a kind\n", "I need to keep you here\n", "I need to picture you still\n", "I need to clear the fog\n", "\n[Chorus]\n", "We're not happy til we're running away\n", "Clouds in your eyes\n", "We're nothing but the foggiest day\n", "Clouds in your eyes\n", "We're not happy til we're running away\n", "Clouds in your eyes\n", "We're nothing but the foggiest day\n"], player_id: "1-6717709", source: {id: 6717709, links: {original: "https://www.musixmatch.com/lyrics/542702/6717709"}, name: "musixmatch"}, title: "Chinatown"}}
        end

        def tags_data
          {:track=>{:tags=>[{:name=>"Pop"}]}}
        end
      end
    end
  end
end
