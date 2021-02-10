module Helpers
  module Bandcamp
    module Track
      class << self
        def info_album_data
          {:track=>{:album=>{:title=>"Indigo"}, :artist=>{:name=>"Wild Nothing"}, :audio=>{:link=>"https://bandcamp.com/stream_redirect?enc=mp3-128&track_id=2723372494&ts=1612708537&t=f7d5162988522e45d0a9dc2d476d9c98b0911968", :present=>true, :source=>"bandcamp"}, :description=>"", :id=>1, :images=>{:extrasmall=>"https://f4.bcbits.com/img/a3221996752_42.jpg", :large=>"https://f4.bcbits.com/img/a3221996752_5.jpg", :medium=>"https://f4.bcbits.com/img/a3221996752_4.jpg", :original=>"https://f4.bcbits.com/img/a3221996752_10.jpg", :small=>"https://f4.bcbits.com/img/a3221996752_3.jpg"}, :length=>221, :tags=>["Rock", "indie", "indie pop", "Blacksburg"], :title=>"Letting Go"}}
        end

        def info_description_data
          {:track=>{:album=>{}, :artist=>{:name=>"Wild Nothing"}, :audio=>{:link=>"https://bandcamp.com/stream_redirect?enc=mp3-128&track_id=1709958085&ts=1612708110&t=30cce18e40110d26576d391ffedaa43849e1e741", :present=>true, :source=>"bandcamp"}, :description=>"From Jack Tatum: “There were a number of songs that were kicking when I was finishing Indigo and ‘Blue Wings’ was very nearly included. I had sent the album off to mastering, but the song didn't sit right with me and I decided, at the last possible moment, to leave it off the album. It's intentionally a very bittersweet sounding song. I asked Ben Talmi who did the string arrangements on ‘Shadow’ to help out...", :id=>1, :images=>{:extrasmall=>"https://f4.bcbits.com/img/a3861181658_42.jpg", :large=>"https://f4.bcbits.com/img/a3861181658_5.jpg", :medium=>"https://f4.bcbits.com/img/a3861181658_4.jpg", :original=>"https://f4.bcbits.com/img/a3861181658_10.jpg", :small=>"https://f4.bcbits.com/img/a3861181658_3.jpg"}, :length=>225, :tags=>["Rock", "indie", "indie pop", "Blacksburg"], :title=>"Blue Wings"}}
        end
      end
    end
  end
end
