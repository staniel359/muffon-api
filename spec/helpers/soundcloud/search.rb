module Helpers
  module SoundCloud
    module Search
      class << self
        def albums_data
          {:search=>{:albums=>[{:artist=>"capturedtracks", :soundcloud_id=>3877449, :title=>"Wild Nothing // 'Empty Estate' EP"}, {:artist=>"Wild_Nothing", :soundcloud_id=>249571740, :title=>"Golden Haze"}, {:artist=>"Wild_Nothing", :soundcloud_id=>956880874, :title=>"Foyer"}, {:artist=>"Wild_Nothing", :soundcloud_id=>923183032, :title=>"Nowhere"}, {:artist=>"Wild_Nothing", :soundcloud_id=>923319688, :title=>"Cloudbusting"}, {:artist=>"Wild Test", :soundcloud_id=>494279820, :title=>"Nothing Remains"}, {:artist=>"Wild Boys/ Yung Believers", :soundcloud_id=>3456633, :title=>"Nothing Found"}, {:artist=>"MARY GO WILD", :soundcloud_id=>358931788, :title=>"[MARYBLACK002] Charlotte de Witte - Closer EP"}]}}
        end

        def tracks_data
          {:search=>{:tracks=>[{:artist=>"luxury elite", :audio=>{:id=>233855641, :present=>true, :source=>"soundcloud"}, :length=>276, :title=>"猫 シ Corp. - The Dress (feat. Luxury Elite)"}, {:artist=>"scubb", :audio=>{:id=>296774474, :present=>true, :source=>"soundcloud"}, :length=>46, :title=>"LUXURY ELITE - ALL NIGHT"}, {:artist=>"luxury elite", :audio=>{:id=>139811960, :present=>true, :source=>"soundcloud"}, :length=>167, :title=>"foreign"}, {:artist=>"luxury elite", :audio=>{:id=>198854600, :present=>true, :source=>"soundcloud"}, :length=>181, :title=>"luxury elite x tendencies - glowing"}, {:artist=>"luxury elite", :audio=>{:id=>190534154, :present=>true, :source=>"soundcloud"}, :length=>191, :title=>"hurt"}, {:artist=>"DAILY MIDNIGHT MESMERISM", :audio=>{:id=>290482630, :present=>true, :source=>"soundcloud"}, :length=>288, :title=>"luxury elite - S.W.A.K. (DAILY MIDNIGHT MESMERISM's Late Night Hi-Fi Remaster)"}, {:artist=>"luxury elite", :audio=>{:id=>107601214, :present=>true, :source=>"soundcloud"}, :length=>117, :title=>"phoebe"}, {:artist=>"␛ l i f e", :audio=>{:id=>101299955, :present=>true, :source=>"soundcloud"}, :length=>62, :title=>"LUXURY ELITE - ALL NIGHT {420}"}, {:artist=>"luxury elite", :audio=>{:id=>215691583, :present=>true, :source=>"soundcloud"}, :length=>162, :title=>"blush"}, {:artist=>"luxury elite", :audio=>{:id=>173743440, :present=>true, :source=>"soundcloud"}, :length=>198, :title=>"attitude"}]}}
        end
      end
    end
  end
end
