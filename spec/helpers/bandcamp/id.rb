module Helpers
  module Bandcamp
    module Id
      class << self
        def album_data
          {:artist_id=>2228040235, :id=>452973411, :type=>"album"}
        end

        def artist_data
          {:id=>2228040235, :type=>"artist"}
        end

        def label_data
          {:id=>2304199212, :type=>"label"}
        end

        def track_data
          {:artist_id=>2228040235, :id=>2723372494, :type=>"track"}
        end
      end
    end
  end
end
