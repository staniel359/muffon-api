module Helpers
  module LastFM
    module Album
      class << self
        def info_data
          {:album=>{:artist=>"Wild Nothing", :covers=>{:large=>"https://lastfm.freetls.fastly.net/i/u/600x600/3601d7b9f23e43aea6f9fa002672c6eb.png", :medium=>"https://lastfm.freetls.fastly.net/i/u/300x300/3601d7b9f23e43aea6f9fa002672c6eb.png", :original=>"https://lastfm.freetls.fastly.net/i/u/3601d7b9f23e43aea6f9fa002672c6eb.png"}, :description=>"Nocturne is the second studio album by American dream pop act Wild Nothing, released on August 28, 2012 on Captured Tracks.\n\nThe success of Wild Nothing's debut allowed Jack Tatum to record in a full studio for its follow-up, a change of pace from Gemini's exclusive use of the laptop for recording. Working with producer Nicolas Vernhes, Tatum stated: “The biggest thing was just having a producer, having somebody extremely knowledgeable to work with. I mean, obviously I had a lot of nice equipment at my disposal for the first time, too ... But I never wanted to use any of that to pursue a wholly different sound to the first album; it was just nice to have somebody to bounce ideas off, to help me tweak things.” \"Shadow,\" the first song from Nocturne to be released, features a string section, something Tatum \"never\" could have done without a studio environment", :listeners_count=>247670, :mbid=>"172124dd-72da-4822-9945-e81b262ca7b3", :plays_count=>6178839, :tags=>["2012", "dream pop", "best of 2012", "indie", "favorite albums"], :title=>"Nocturne", :tracks=>[{:id=>1, :length=>258, :title=>"Shadow"}, {:id=>2, :length=>185, :title=>"Midnight Song"}, {:id=>3, :length=>318, :title=>"Nocturne"}, {:id=>4, :length=>260, :title=>"Through the Grass"}, {:id=>5, :length=>200, :title=>"Only Heather"}, {:id=>6, :length=>218, :title=>"This Chain Won’t Break"}, {:id=>7, :length=>209, :title=>"Disappear Always"}, {:id=>8, :length=>330, :title=>"Paradise"}, {:id=>9, :length=>231, :title=>"Counting Days"}, {:id=>10, :length=>207, :title=>"The Blue Dress"}, {:id=>11, :length=>235, :title=>"Rheya"}]}}
        end

        def listeners_count_data
          {:listeners_count => 249779}
        end
      end
    end
  end
end
