module Helpers
  module VK
    module Track
      class << self
        def info_data
          {:track=>{:albums=>[{:access_hash=>"43c15929fe11506130", :owner_id=>-2000916168, :vk_id=>1916168}], :artist=>{:name=>"The Smiths"}, :artists=>[{:name=>"The Smiths"}], :audio=>{:link=>"http://localhost:4001/temp/audio/vk/371745443_456465176_6e46a45bb6be1e67e6_698622eb5a2c8a0616.mp3", :present=>true, :source_id=>"vk"}, :duration=>"06:24", :image=>{:extrasmall=>"https://sun9-67.userapi.com/impf/c851436/v851436580/51ac2/d_xzbz1Ic5M.jpg?size=150x150&quality=96&sign=22f650c9242226587e2c43d2faf047d7&type=audio", :large=>"https://sun9-67.userapi.com/impf/c851436/v851436580/51ac2/d_xzbz1Ic5M.jpg?size=150x150&quality=96&sign=22f650c9242226587e2c43d2faf047d7&type=audio", :medium=>"https://sun9-67.userapi.com/impf/c851436/v851436580/51ac2/d_xzbz1Ic5M.jpg?size=150x150&quality=96&sign=22f650c9242226587e2c43d2faf047d7&type=audio", :original=>"https://sun9-67.userapi.com/impf/c851436/v851436580/51ac2/d_xzbz1Ic5M.jpg?size=150x150&quality=96&sign=22f650c9242226587e2c43d2faf047d7&type=audio", :small=>"https://sun9-67.userapi.com/impf/c851436/v851436580/51ac2/d_xzbz1Ic5M.jpg?size=150x150&quality=96&sign=22f650c9242226587e2c43d2faf047d7&type=audio"}, :player_id=>"1", :title=>"The Queen Is Dead", :vk_id=>"371745443_456465176_5dcdb6971eea721213_26e8f2cb1f50114bf7", :with_more=>{}}}
        end

        def info_no_album_data
          {:track=>{:albums=>[], :artist=>{:name=>"ナイトメア"}, :artists=>[{:name=>"ナイトメア"}], :audio=>{:link=>"http://localhost:4001/temp/audio/vk/-400921_90392497_a11e43c96aba9c3335_11b443938410e06e4b.mp3", :present=>true, :source_id=>"vk"}, :duration=>"04:59", :image=>{:extrasmall=>"https://lastfm.freetls.fastly.net/i/u/64s/4128a6eb29f94943c9d206c08e625904.png", :large=>"https://lastfm.freetls.fastly.net/i/u/600x600/4128a6eb29f94943c9d206c08e625904.png", :medium=>"https://lastfm.freetls.fastly.net/i/u/300x300/4128a6eb29f94943c9d206c08e625904.png", :original=>"https://lastfm.freetls.fastly.net/i/u/4128a6eb29f94943c9d206c08e625904.png", :small=>"https://lastfm.freetls.fastly.net/i/u/174s/4128a6eb29f94943c9d206c08e625904.png"}, :player_id=>"1", :title=>"Alumina", :vk_id=>"-400921_90392497_41eb73bbee1d6d2165_b982e19a6894a87a29", :with_more=>{}}}
        end
      end
    end
  end
end
