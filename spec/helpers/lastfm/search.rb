module Helpers
  module LastFM
    module Search
      class << self
        def artists_data
          {:search=>{:artists=>[{:listeners_count=>545256, :name=>"Wild Nothing"}, {:listeners_count=>811, :name=>"Wild_Nothing"}, {:listeners_count=>233, :name=>"Wild Nothing //"}, {:listeners_count=>132, :name=>"Wild Nothing /"}, {:listeners_count=>178, :name=>"Beach Fossils feat. Wild Nothing"}], :page=>1, :query=>"wild nothing"}}
        end

        def albums_data
          {:search=>{:albums=>[{:artist=>"Wild Nothing", :cover=>"https://lastfm.freetls.fastly.net/i/u/64s/3601d7b9f23e43aea6f9fa002672c6eb.png", :title=>"Nocturne"}, {:artist=>"Wild Nothing", :cover=>"", :title=>"Nocturne [Bonus Tracks]"}, {:artist=>"Wild Nothing", :cover=>"", :title=>"Wild Nothing - Nocturne"}, {:artist=>"Wild Nothing", :cover=>"", :title=>"(2012) Nocturne"}, {:artist=>"Wild Nothing", :cover=>"", :title=>"Nocturne - mu-sique.com"}], :page=>1, :query=>"wild nothing nocturne"}}
        end

        def tracks_data
          {:search=>{:page=>1, :query=>"wild nothing chinatown", :tracks=>[{:artist=>"Wild Nothing", :listeners_count=>207115, :title=>"Chinatown"}, {:artist=>"Wild Nothing", :listeners_count=>1574, :title=>"Chinatown - Live from Brooklyn Steel"}, {:artist=>"Wild Nothing", :listeners_count=>202, :title=>"Chinatown - Wild Nothing"}, {:artist=>"The Hood Internet", :listeners_count=>667, :title=>"Walking In Chinatown (Empire Of The Sun x Wild Nothing)"}, {:artist=>"Wild Nothing", :listeners_count=>147, :title=>"Wild Nothing - Chinatown"}]}}
        end
      end
    end
  end
end
