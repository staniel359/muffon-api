module Helpers
  module Bandcamp
    module Id
      class << self
        def album_data
          {:artist=>{:id=>2228040235}, :id=>452973411, :model=>"album"}
        end

        def artist_data
          {:id=>2228040235, :model=>"artist"}
        end

        def label_data
          {:id=>2304199212, :model=>"label"}
        end

        def track_data
          {:artist=>{:id=>2228040235}, :id=>2723372494, :model=>"track"}
        end
      end
    end
  end
end
