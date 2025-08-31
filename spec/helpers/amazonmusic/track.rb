module Spec
  module Helpers
    module AmazonMusic
      module Track
        def amazonmusic_track_info_data
          {:track=>{:album=>{:source=>{:id=>"B00BRRGQAI", :name=>"amazonmusic"}, :title=>"Gemini"}, :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>"B002ZXIYRG", :name=>"amazonmusic"}}], :audio=>{:link=>"http://localhost:4001/media/audio/amazonmusic/B00BRRGTQ4.mp4", :present=>true}, :duration=>198, :image=>{:extrasmall=>"https://m.media-amazon.com/images/I/411Z4A-J2EL._SX50_SY50_.jpg", :large=>"https://m.media-amazon.com/images/I/411Z4A-J2EL._SX600_SY600_.jpg", :medium=>"https://m.media-amazon.com/images/I/411Z4A-J2EL._SX300_SY300_.jpg", :original=>"https://m.media-amazon.com/images/I/411Z4A-J2EL._SX1000_SY1000_.jpg", :small=>"https://m.media-amazon.com/images/I/411Z4A-J2EL._SX100_SY100_.jpg"}, :player_id=>"1-B00BRRGTQ4", :source=>{:album_id=>"B00BRRGQAI", :id=>"B00BRRGTQ4", :links=>{:original=>"https://music.amazon.com/albums/B00BRRGQAI?trackAsin=B00BRRGTQ4", :streaming=>"https://song.link/a/B00BRRGTQ4"}, :name=>"amazonmusic"}, :title=>"Chinatown"}}
        end

        def amazonmusic_track_links_data
          {:track=>{:links=>{:original=>"https://music.amazon.com/albums/B00BRRGQAI?trackAsin=B00BRRGTQ4", :streaming=>"https://song.link/a/B00BRRGTQ4"}}}
        end

        def amazonmusic_track_albums_data
          {:track=>{:albums=>[{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>"B002ZXIYRG", :name=>"amazonmusic"}}], :image=>{:extrasmall=>"https://m.media-amazon.com/images/I/411Z4A-J2EL._SX50_SY50_.jpg", :large=>"https://m.media-amazon.com/images/I/411Z4A-J2EL._SX600_SY600_.jpg", :medium=>"https://m.media-amazon.com/images/I/411Z4A-J2EL._SX300_SY300_.jpg", :original=>"https://m.media-amazon.com/images/I/411Z4A-J2EL._SX1000_SY1000_.jpg", :small=>"https://m.media-amazon.com/images/I/411Z4A-J2EL._SX100_SY100_.jpg"}, :release_date=>"2010-05-25", :source=>{:id=>"B00BRRGQAI", :links=>{:original=>"https://music.amazon.com/albums/B00BRRGQAI", :streaming=>"https://album.link/a/B00BRRGQAI"}, :name=>"amazonmusic"}, :title=>"Gemini"}], :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>"B002ZXIYRG", :name=>"amazonmusic"}}], :player_id=>"1-B00BRRGTQ4", :source=>{:album_id=>"B00BRRGQAI", :id=>"B00BRRGTQ4", :links=>{:original=>"https://music.amazon.com/albums/B00BRRGQAI?trackAsin=B00BRRGTQ4", :streaming=>"https://song.link/a/B00BRRGTQ4"}, :name=>"amazonmusic"}, :title=>"Chinatown"}}
        end
      end
    end
  end
end
