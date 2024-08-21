module Helpers
  module Spotify
    module Track
      class << self
        def albums_data
          {:track=>{:albums=>[{:artist=>{:name=>"Kate Bush"}, :artists=>[{:name=>"Kate Bush", :source=>{:id=>"1aSxMhuvixZ8h9dK9jIDwL", :name=>"spotify"}}], :image=>{:extrasmall=>"https://i.scdn.co/image/ab67616d000048515c390e413e27798edd4d18b4", :large=>"https://i.scdn.co/image/ab67616d0000b2735c390e413e27798edd4d18b4", :medium=>"https://i.scdn.co/image/ab67616d00001e025c390e413e27798edd4d18b4", :original=>"https://i.scdn.co/image/ab67616d0000b2735c390e413e27798edd4d18b4", :small=>"https://i.scdn.co/image/ab67616d000048515c390e413e27798edd4d18b4"}, :release_date=>"1985-09-16", :source=>{:id=>"3OYnManu1Nlxnw9OMng7BH", :links=>{:original=>"https://open.spotify.com/album/3OYnManu1Nlxnw9OMng7BH", :streaming=>"https://album.link/s/3OYnManu1Nlxnw9OMng7BH"}, :name=>"spotify"}, :title=>"Hounds of Love (2018 Remaster)"}], :artist=>{:name=>"Kate Bush"}, :artists=>[{:name=>"Kate Bush", :source=>{:id=>"1aSxMhuvixZ8h9dK9jIDwL", :name=>"spotify"}}], :player_id=>"1-29d0nY7TzCoi22XBqDQkiP", :source=>{:id=>"29d0nY7TzCoi22XBqDQkiP", :links=>{:original=>"https://open.spotify.com/track/29d0nY7TzCoi22XBqDQkiP", :streaming=>"https://song.link/s/29d0nY7TzCoi22XBqDQkiP"}, :name=>"spotify"}, :title=>"Running Up That Hill (A Deal With God) - 2018 Remaster"}}
        end

        def info_data
          {:track=>{:album=>{:source=>{:id=>"3OYnManu1Nlxnw9OMng7BH", :name=>"spotify"}, :title=>"Hounds of Love (2018 Remaster)"}, :artist=>{:name=>"Kate Bush"}, :artists=>[{:name=>"Kate Bush", :source=>{:id=>"1aSxMhuvixZ8h9dK9jIDwL", :name=>"spotify"}}], :audio=>{:link=>"http://localhost:4001/media/audio/spotify/29d0nY7TzCoi22XBqDQkiP.m4a", :present=>true}, :duration=>301, :image=>{:extrasmall=>"https://i.scdn.co/image/ab67616d000048515c390e413e27798edd4d18b4", :large=>"https://i.scdn.co/image/ab67616d0000b2735c390e413e27798edd4d18b4", :medium=>"https://i.scdn.co/image/ab67616d00001e025c390e413e27798edd4d18b4", :original=>"https://i.scdn.co/image/ab67616d0000b2735c390e413e27798edd4d18b4", :small=>"https://i.scdn.co/image/ab67616d000048515c390e413e27798edd4d18b4"}, :player_id=>"1-29d0nY7TzCoi22XBqDQkiP", :source=>{:id=>"29d0nY7TzCoi22XBqDQkiP", :links=>{:original=>"https://open.spotify.com/track/29d0nY7TzCoi22XBqDQkiP", :streaming=>"https://song.link/s/29d0nY7TzCoi22XBqDQkiP"}, :name=>"spotify"}, :title=>"Running Up That Hill (A Deal With God) - 2018 Remaster"}}
        end

        def links_data
          {:track=>{:links=>{:original=>"https://open.spotify.com/track/29d0nY7TzCoi22XBqDQkiP", :streaming=>"https://song.link/s/29d0nY7TzCoi22XBqDQkiP"}}}
        end
      end
    end
  end
end
