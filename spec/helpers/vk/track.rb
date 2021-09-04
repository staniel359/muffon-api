module Helpers
  module VK
    module Track
      class << self
        def info_data
          {:track=>{:albums=>[], :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :vk_id=>"4333005440018923962"}], :audio=>{:link=>"http://localhost:4001/temp/audio/vk/-2001472560_55472560.mp3", :present=>true, :source_id=>"vk"}, :duration=>"03:29", :extra_title=>"Live from Brooklyn Steel", :image=>{:extrasmall=>"https://lastfm.freetls.fastly.net/i/u/64s/4128a6eb29f94943c9d206c08e625904.png", :large=>"https://lastfm.freetls.fastly.net/i/u/600x600/4128a6eb29f94943c9d206c08e625904.png", :medium=>"https://lastfm.freetls.fastly.net/i/u/300x300/4128a6eb29f94943c9d206c08e625904.png", :original=>"https://lastfm.freetls.fastly.net/i/u/4128a6eb29f94943c9d206c08e625904.png", :small=>"https://lastfm.freetls.fastly.net/i/u/174s/4128a6eb29f94943c9d206c08e625904.png"}, :player_id=>"1", :title=>"Chinatown", :with_more=>{}}}
        end

        def info_no_album_data
          {:track=>{:albums=>[], :artist=>{:name=>"ナイトメア"}, :artists=>[{:name=>"ナイトメア"}], :audio=>{:link=>"http://localhost:4001/temp/audio/vk/-400921_90392497.mp3", :present=>true, :source_id=>"vk"}, :duration=>"04:59", :image=>{:extrasmall=>"https://lastfm.freetls.fastly.net/i/u/64s/4128a6eb29f94943c9d206c08e625904.png", :large=>"https://lastfm.freetls.fastly.net/i/u/600x600/4128a6eb29f94943c9d206c08e625904.png", :medium=>"https://lastfm.freetls.fastly.net/i/u/300x300/4128a6eb29f94943c9d206c08e625904.png", :original=>"https://lastfm.freetls.fastly.net/i/u/4128a6eb29f94943c9d206c08e625904.png", :small=>"https://lastfm.freetls.fastly.net/i/u/174s/4128a6eb29f94943c9d206c08e625904.png"}, :player_id=>"1", :title=>"Alumina", :with_more=>{}}}
        end
      end
    end
  end
end
