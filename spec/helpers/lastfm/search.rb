module Helpers
  module LastFM
    module Search
      class << self
        def artists_data
          {:search=>{:artists=>[{:image=>"https://lastfm.freetls.fastly.net/i/u/64s/22f79109136549c1afb6942d06b56b7c.jpg", :listeners_count=>546308, :name=>"Wild Nothing"}, {:image=>"https://lastfm.freetls.fastly.net/i/u/64s/2a96cbd8b46e442fc41c2b86b821562f.jpg", :listeners_count=>812, :name=>"Wild_Nothing"}, {:image=>"https://lastfm.freetls.fastly.net/i/u/64s/2a96cbd8b46e442fc41c2b86b821562f.jpg", :listeners_count=>233, :name=>"Wild Nothing //"}, {:image=>"https://lastfm.freetls.fastly.net/i/u/64s/2a96cbd8b46e442fc41c2b86b821562f.jpg", :listeners_count=>132, :name=>"Wild Nothing /"}, {:image=>"https://lastfm.freetls.fastly.net/i/u/64s/2a96cbd8b46e442fc41c2b86b821562f.jpg", :listeners_count=>180, :name=>"Beach Fossils feat. Wild Nothing"}]}}
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
