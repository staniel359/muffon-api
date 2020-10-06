module Helpers
  module LastFM
    RANDOM_STRING = 'wejlhg239gh23'.freeze

    class << self
      def not_found_data
        { error: 'Not found.' }
      end

      def artist_info_data
        {:artist=>{:description=>"Wild Nothing is the solo project of Virginia-born Jack Tatum. Tatum began recording under the moniker Wild Nothing in the summer of 2009 in Blacksburg, Virginia. Upon gathering attention in indie music circles, he was signed with the Captured Tracks record label and began touring with a band. His debut full-length, \"Gemini,\" was released in spring 2010 to acclaim from Pitchfork Media and the music editors at Amazon.com. A follow-up album called \"Nocturne\" was released in 2012. His second EP \"Empty Estate\" was released in May 2013. Tatum's third LP entitled \"Life of Pause\" was released on February 19, 2016.", :listeners_count=>544578, :mbid=>"a181595e-5b84-4439-a5f4-f548ddfb64df", :name=>"Wild Nothing", :plays_count=>18879889, :similar_artists=>["Craft Spells", "Beach Fossils", "DIIV", "Small Black", "Blouse"], :tags=>["dream pop", "shoegaze", "indie pop", "indie", "seen live"]}}
      end

      def artist_images_data
        {:artist=>{:name=>"Wild Nothing", :images=>["https://lastfm.freetls.fastly.net/i/u/200ae0a4719dd1cc72a2e86411d63335", "https://lastfm.freetls.fastly.net/i/u/22f79109136549c1afb6942d06b56b7c", "https://lastfm.freetls.fastly.net/i/u/da501dd32b674fd8a142d6c37c215482", "https://lastfm.freetls.fastly.net/i/u/85382d1d98294ee85c063271310c048d", "https://lastfm.freetls.fastly.net/i/u/7027e7ec21b1a2441f63bd0ba63376a4", "https://lastfm.freetls.fastly.net/i/u/3ab61151452be7ec198185106701b4bf", "https://lastfm.freetls.fastly.net/i/u/eec8d4a19d8b8bfcca4dda63852c2d96", "https://lastfm.freetls.fastly.net/i/u/366b5319c7984bb3b5084d12cbc5c7a7", "https://lastfm.freetls.fastly.net/i/u/19f85029859341e18b2eb68ebb856f3e", "https://lastfm.freetls.fastly.net/i/u/897a6c0bda434287956158c691090e57", "https://lastfm.freetls.fastly.net/i/u/bc4e3c8d6028e4944131a7d2563c9cd3", "https://lastfm.freetls.fastly.net/i/u/61d2f5916075eee85d3cfbe440e3c5ee", "https://lastfm.freetls.fastly.net/i/u/26c9b5bba82125477e9bd4c6b2f4650d", "https://lastfm.freetls.fastly.net/i/u/42ab10a6446fc131831716b4f6516a5f", "https://lastfm.freetls.fastly.net/i/u/98b0b9c5739546c7b5ea379950ef72e7", "https://lastfm.freetls.fastly.net/i/u/fa739b942632407bacf7c0683fbd6aa1", "https://lastfm.freetls.fastly.net/i/u/ebb4be5dd53f4399965c5235f48e3964", "https://lastfm.freetls.fastly.net/i/u/f9398f6f4c80dc5caee666e175f4e4bd", "https://lastfm.freetls.fastly.net/i/u/7b351bd330ca462b909c4932c2647e6e", "https://lastfm.freetls.fastly.net/i/u/b6502cb046b445d6ade64e3511cc922b", "https://lastfm.freetls.fastly.net/i/u/5f583b3b5336475caa2beeb93a7d545c", "https://lastfm.freetls.fastly.net/i/u/721721158f1e4cc7cc41604349bd535a", "https://lastfm.freetls.fastly.net/i/u/6bf397e317ff80d51042cc97757eafc3", "https://lastfm.freetls.fastly.net/i/u/ef46ec1540f943e19af0d5ade9f08da6", "https://lastfm.freetls.fastly.net/i/u/ac0be21ef65a90aab89b0257be8ff57b", "https://lastfm.freetls.fastly.net/i/u/1831534e73f031571d9f981440dbbb5a", "https://lastfm.freetls.fastly.net/i/u/aa8ef34d57785709a61e8f131bee727e", "https://lastfm.freetls.fastly.net/i/u/e0126f28d4f64d4dcd8d276933b93bfc", "https://lastfm.freetls.fastly.net/i/u/adf1d666b7db4ee8ab65fa9afbc6f74c", "https://lastfm.freetls.fastly.net/i/u/f076c0a8e5d741d9be5a0a5099b8a40b", "https://lastfm.freetls.fastly.net/i/u/bffc54f3e3b84bb288b090eb6d56b3dc", "https://lastfm.freetls.fastly.net/i/u/8612765cc17f4b0996cdca0f6d08928b", "https://lastfm.freetls.fastly.net/i/u/b80b543f5e3b42679ad3ab005a7a7bdf", "https://lastfm.freetls.fastly.net/i/u/fa582fdb0fb644abb14388d0f75f7fcd", "https://lastfm.freetls.fastly.net/i/u/1d0427bdc6624bc88003f18c99a4206f", "https://lastfm.freetls.fastly.net/i/u/b794e49e786318fb9fd2575944881340", "https://lastfm.freetls.fastly.net/i/u/4ea801e45ece470ca043ed84eb32aa14", "https://lastfm.freetls.fastly.net/i/u/4ded266f515148709b7e281035c28995", "https://lastfm.freetls.fastly.net/i/u/d9c458e967a5f95b6b011c756bdd7dd5", "https://lastfm.freetls.fastly.net/i/u/79c78fd900dd4a3ba943535ab0513e28"], :page=>1}}
      end

      def artist_tracks_data
        {:artist=>{:name=>"Wild Nothing", :page=>1, :tracks=>[{:listeners_count=>206932, :plays_count=>1212024, :title=>"Chinatown"}, {:listeners_count=>197182, :plays_count=>1188281, :title=>"Shadow"}, {:listeners_count=>161388, :plays_count=>970938, :title=>"Live In Dreams"}, {:listeners_count=>160701, :plays_count=>969833, :title=>"Summer Holiday"}, {:listeners_count=>131370, :plays_count=>825079, :title=>"Nocturne"}]}}
      end

      def artist_albums_data
        {:artist=>{:albums=>[{:cover=>"https://lastfm.freetls.fastly.net/i/u/c60a738cd2244da9bc2b44b51d643602.png", :plays_count=>7086343, :title=>"Gemini"}, {:cover=>"https://lastfm.freetls.fastly.net/i/u/3601d7b9f23e43aea6f9fa002672c6eb.png", :plays_count=>6177891, :title=>"Nocturne"}, {:cover=>"https://lastfm.freetls.fastly.net/i/u/d0398f9a72434e60a3d0479ffbb46c68.png", :plays_count=>689031, :title=>"Golden Haze"}, {:cover=>"https://lastfm.freetls.fastly.net/i/u/ae54820568b7b3e42e9fe0fca2155f20.png", :plays_count=>907987, :title=>"Life of Pause"}, {:cover=>"https://lastfm.freetls.fastly.net/i/u/ee3fa5a535164e01b6f46496adb3240b.png", :plays_count=>777051, :title=>"Empty Estate"}], :name=>"Wild Nothing", :page=>1}}
      end

      def artist_similar_data
        {:artist=>{:name=>"Wild Nothing", :similar=>["Craft Spells", "Beach Fossils", "DIIV", "Small Black", "Blouse", "Real Estate", "The Radio Dept.", "Hibou", "Lower Dens", "The Pains of Being Pure at Heart", "Beach House", "Porcelain Raft", "Washed Out", "Lotus Plaza", "Day Wave", "Minks", "Seapony", "Deerhunter", "Widowspeak", "Frankie Rose", "Heavenly Beat", "Pinkshinyultrablast", "Tamaryn", "Airiel", "Still Corners", "Twin Shadow", "Galaxie 500", "Alvvays", "TOPS", "Slowdive", "Youth Lagoon", "The Drums", "Yuck", "A Sunny Day In Glasgow", "Japanese Breakfast", "Yumi Zouma", "Chapterhouse", "Atlas Sound", "Asobi Seksu", "The Bilinda Butchers", "Whirr", "Ringo Deathstarr", "Memoryhouse", "Drop Nineteens", "Foxes in Fiction", "Gardens & Villa", "Melody's Echo Chamber", "Ride", "No Joy", "Memory Tapes"]}}
      end

      def album_info_data
        {:album=>{:artist=>"Wild Nothing", :cover=>"https://lastfm.freetls.fastly.net/i/u/3601d7b9f23e43aea6f9fa002672c6eb.png", :description=>"Nocturne is the second studio album by American dream pop act Wild Nothing, released on August 28, 2012 on Captured Tracks.\n\nThe success of Wild Nothing's debut allowed Jack Tatum to record in a full studio for its follow-up, a change of pace from Gemini's exclusive use of the laptop for recording. Working with producer Nicolas Vernhes, Tatum stated: “The biggest thing was just having a producer, having somebody extremely knowledgeable to work with. I mean, obviously I had a lot of nice equipment at my disposal for the first time, too ... But I never wanted to use any of that to pursue a wholly different sound to the first album; it was just nice to have somebody to bounce ideas off, to help me tweak things.” \"Shadow,\" the first song from Nocturne to be released, features a string section, something Tatum \"never\" could have done without a studio environment", :listeners_count=>247581, :mbid=>"172124dd-72da-4822-9945-e81b262ca7b3", :plays_count=>6177029, :tags=>["2012", "dream pop", "best of 2012", "indie", "favorite albums"], :title=>"Nocturne", :tracks=>[{:length=>258, :title=>"Shadow"}, {:length=>185, :title=>"Midnight Song"}, {:length=>318, :title=>"Nocturne"}, {:length=>260, :title=>"Through the Grass"}, {:length=>200, :title=>"Only Heather"}, {:length=>218, :title=>"This Chain Won’t Break"}, {:length=>209, :title=>"Disappear Always"}, {:length=>330, :title=>"Paradise"}, {:length=>231, :title=>"Counting Days"}, {:length=>207, :title=>"The Blue Dress"}, {:length=>235, :title=>"Rheya"}]}}
      end

      def track_info_data
        {:track=>{:album=>{:cover=>"https://lastfm.freetls.fastly.net/i/u/391be121643ab50801b7955b0ac5b50c.png", :title=>"Hounds of Love"}, :artist=>"Kate Bush", :description=>"\"Hounds of Love\" is a song written, produced and performed by British singer Kate Bush. It is the title track and the third single released from her number one 1985 album Hounds of Love. The single was released on 24 February 1986, and reached number 18 in the UK Singles Chart. \n\nIn October 2004, Q magazine placed this song at No.21 in its list of the 50 greatest British songs of all-time. \n\nBritish band The Futureheads covered the song in 2005, scoring a UK top 10 hit with it.", :length=>182, :listeners_count=>273732, :mbid=>"984deb15-92f3-4917-9929-c0e930dc8a54", :plays_count=>1785219, :tags=>["80s", "female vocalists", "pop", "alternative", "singer-songwriter"], :title=>"Hounds of Love"}}
      end

      def search_artists_data
        {:search=>{:page=>1, :query=>{:artist=>"wild nothing"}, :results=>[{:listeners_count=>544578, :name=>"Wild Nothing"}, {:listeners_count=>811, :name=>"Wild_Nothing"}, {:listeners_count=>232, :name=>"Wild Nothing //"}, {:listeners_count=>132, :name=>"Wild Nothing /"}, {:listeners_count=>178, :name=>"Beach Fossils feat. Wild Nothing"}]}}
      end

      def search_tracks_data
        {:search=>{:page=>1, :query=>{:track=>"chinatown"}, :results=>[{:artist=>"Wild Nothing", :listeners_count=>206932, :title=>"Chinatown"}, {:artist=>"Destroyer", :listeners_count=>144132, :title=>"Chinatown"}, {:artist=>"Jets to Brazil", :listeners_count=>67859, :title=>"Chinatown"}, {:artist=>"Liam Gallagher", :listeners_count=>35682, :title=>"Chinatown"}, {:artist=>"Do Make Say Think", :listeners_count=>54999, :title=>"Chinatown"}]}}
      end

      def search_albums_data
        {:search=>{:page=>1, :query=>{:album=>"nocturne"}, :results=>[{:artist=>"Wild Nothing", :cover=>"https://lastfm.freetls.fastly.net/i/u/3601d7b9f23e43aea6f9fa002672c6eb.png", :title=>"Nocturne"}, {:artist=>"The Human Abstract", :cover=>"https://lastfm.freetls.fastly.net/i/u/48fe94c4cd994edfbff13e0c87234bce.png", :title=>"Nocturne"}, {:artist=>"Frédéric Chopin", :cover=>"https://lastfm.freetls.fastly.net/i/u/f6bb721f7c8dcff4892a2af2d1d60bb3.png", :title=>"Chopin: Nocturnes"}, {:artist=>"Little Boots", :cover=>"https://lastfm.freetls.fastly.net/i/u/850d9b20c6ff4f02cfa9d378b578b405.png", :title=>"Nocturnes"}, {:artist=>"Frédéric Chopin", :cover=>"https://lastfm.freetls.fastly.net/i/u/4d694d0ca275a963112708eff502db87.png", :title=>"Chopin: Nocturnes (Volume 1)"}]}}
      end

      def search_artists_empty_data
        {:search=>{:page=>1, :query=>{:artist=>"wejlhg239gh23"}, :results=>[]}}
      end

      def search_albums_empty_data
        {:search=>{:page=>1, :query=>{:album=>"wejlhg239gh23"}, :results=>[]}}
      end

      def search_tracks_empty_data
        {:search=>{:page=>1, :query=>{:track=>"wejlhg239gh23"}, :results=>[]}}
      end
    end
  end
end
