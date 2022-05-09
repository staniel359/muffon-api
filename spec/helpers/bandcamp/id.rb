module Helpers
  module Bandcamp
    module Id
      class << self
        def album_data
          {:id=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:bandcamp_id=>2228040235, :name=>"Wild Nothing"}], :bandcamp_id=>452973411, :bandcamp_model=>"album", :title=>"Indigo"}}
        end

        def artist_data
          {:id=>{:bandcamp_id=>2228040235, :bandcamp_model=>"artist", :name=>"Wild Nothing"}}
        end

        def label_data
          {:id=>{:bandcamp_id=>2304199212, :bandcamp_model=>"label", :name=>"Captured Tracks"}}
        end

        def track_data
          {:id=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:bandcamp_id=>2228040235, :name=>"Wild Nothing"}], :bandcamp_id=>2723372494, :bandcamp_model=>"track", :title=>"Letting Go"}}
        end
      end
    end
  end
end
