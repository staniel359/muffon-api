module Helpers
  module Spotify
    module Track
      class << self
        def info_data
          {:track=>{:album=>{:source_id=>"spotify", :spotify_id=>"3OYnManu1Nlxnw9OMng7BH", :title=>"Hounds of Love (2018 Remaster)"}, :artists=>[{:name=>"Kate Bush", :spotify_id=>"1aSxMhuvixZ8h9dK9jIDwL"}], :audio=>{:link=>"http://localhost:4001/test.mp3", :present=>true, :source_id=>"spotify"}, :duration=>"05:01", :duration_seconds=>301, :image=>{:extrasmall=>"https://i.scdn.co/image/ab67616d000048515c390e413e27798edd4d18b4", :large=>"https://i.scdn.co/image/ab67616d0000b2735c390e413e27798edd4d18b4", :medium=>"https://i.scdn.co/image/ab67616d00001e025c390e413e27798edd4d18b4", :original=>"https://i.scdn.co/image/ab67616d0000b2735c390e413e27798edd4d18b4", :small=>"https://i.scdn.co/image/ab67616d000048515c390e413e27798edd4d18b4"}, :player_id=>"1", :source_id=>"spotify", :spotify_id=>"29d0nY7TzCoi22XBqDQkiP", :title=>"Running Up That Hill (A Deal With God) - 2018 Remaster"}}
        end
      end
    end
  end
end
