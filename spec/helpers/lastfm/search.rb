module Helpers
  module LastFM
    module Search
      class << self
        def artists_data
          {:search=>{:artists=>[{:listeners_count=>549337, :name=>"Wild Nothing"}, {:listeners_count=>812, :name=>"Wild_Nothing"}, {:listeners_count=>233, :name=>"Wild Nothing //"}, {:listeners_count=>183, :name=>"Beach Fossils feat. Wild Nothing"}, {:listeners_count=>132, :name=>"Wild Nothing /"}], :page=>1, :query=>"wild nothing", :total_pages=>55}}
        end

        def albums_data
          {:search=>{:albums=>[{:artist=>"Wild Nothing", :cover=>"https://lastfm.freetls.fastly.net/i/u/64s/3601d7b9f23e43aea6f9fa002672c6eb.png", :title=>"Nocturne"}, {:artist=>"Wild Nothing", :cover=>"", :title=>"Nocturne [Bonus Tracks]"}, {:artist=>"Wild Nothing", :cover=>"", :title=>"Wild Nothing - Nocturne"}, {:artist=>"Wild Nothing", :cover=>"", :title=>"(2012) Nocturne"}, {:artist=>"Wild Nothing", :cover=>"", :title=>"Nocturne - mu-sique.com"}], :page=>1, :query=>"wild nothing nocturne", :total_pages=>19}}
        end

        def tracks_data
          {:search=>{:page=>1, :query=>"wild nothing chinatown", :total_pages=>37, :tracks=>[{:artist=>"Wild Nothing", :id=>1, :title=>"Chinatown"}, {:artist=>"Wild Nothing", :id=>2, :title=>"Chinatown - Live from Brooklyn Steel"}, {:artist=>"Wild Nothing", :id=>3, :title=>"Chinatown - Wild Nothing"}, {:artist=>"The Hood Internet", :id=>4, :title=>"Walking In Chinatown (Empire Of The Sun x Wild Nothing)"}, {:artist=>"Wild Nothing", :id=>5, :title=>"Wild Nothing - Chinatown"}]}}
        end
      end
    end
  end
end
