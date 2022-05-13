module Helpers
  module Bandcamp
    module Id
      class << self
        def album_data
          {:id=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :source=>{:artist_id=>2228040235, :id=>452973411, :model=>"album", :name=>"bandcamp"}, :title=>"Indigo"}}
        end

        def artist_data
          {:id=>{:name=>"Wild Nothing", :source=>{:id=>2228040235, :model=>"artist", :name=>"bandcamp"}}}
        end

        def label_data
          {:id=>{:name=>"Captured Tracks", :source=>{:id=>2304199212, :model=>"label", :name=>"bandcamp"}}}
        end

        def track_data
          {:id=>{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>2228040235, :name=>"bandcamp"}}], :source=>{:artist_id=>2228040235, :id=>2723372494, :model=>"track", :name=>"bandcamp"}, :title=>"Letting Go"}}
        end
      end
    end
  end
end
