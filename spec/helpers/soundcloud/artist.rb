module Helpers
  module SoundCloud
    module Artist
      class << self
        def albums_data
          {:artist=>{:albums=>[{:image=>{:extrasmall=>"https://i1.sndcdn.com/artworks-62579d88-f38a-48c3-988a-2d30496d106b-0-t67x67.jpg", :large=>"https://i1.sndcdn.com/artworks-62579d88-f38a-48c3-988a-2d30496d106b-0-t500x500.jpg", :medium=>"https://i1.sndcdn.com/artworks-62579d88-f38a-48c3-988a-2d30496d106b-0-t300x300.jpg", :original=>"https://i1.sndcdn.com/artworks-62579d88-f38a-48c3-988a-2d30496d106b-0-t500x500.jpg", :small=>"https://i1.sndcdn.com/artworks-62579d88-f38a-48c3-988a-2d30496d106b-0-large.jpg"}, :release_date=>"04 Feb 2012", :soundcloud_id=>923183032, :title=>"Nowhere"}], :name=>"Wild_Nothing", :page=>2}}
        end
      end
    end
  end
end
