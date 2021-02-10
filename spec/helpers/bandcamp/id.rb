module Helpers
  module Bandcamp
    module ID
      class << self
        def album_data
          {:album=>{:artist_id=>2228040235, :id=>452973411}}
        end

        def artist_data
          {:artist=>{:id=>2228040235}}
        end

        def label_data
          {:label=>{:id=>2304199212}}
        end

        def track_data
          {:track=>{:artist_id=>2228040235, :id=>2723372494}}
        end
      end
    end
  end
end
