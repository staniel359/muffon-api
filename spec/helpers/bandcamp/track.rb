module Helpers
  module Bandcamp
    module Track
      class << self
        def info_album_data
          {:track=>{:album=>{:title=>"Indigo"}, :artist=>{:name=>"Wild Nothing"}, :audio=>{:link=>"https://bandcamp.com/stream_redirect?enc=mp3-128&track_id=2723372494&ts=1612962551&t=1c260c984ef557282dd5e8142ed488296c4710aa", :present=>true, :source=>"bandcamp"}, :description=>"", :id=>1, :image=>{:extrasmall=>"https://f4.bcbits.com/img/a3221996752_42.jpg", :large=>"https://f4.bcbits.com/img/a3221996752_5.jpg", :medium=>"https://f4.bcbits.com/img/a3221996752_4.jpg", :original=>"https://f4.bcbits.com/img/a3221996752_10.jpg", :small=>"https://f4.bcbits.com/img/a3221996752_3.jpg"}, :length=>221, :tags=>["Rock", "indie", "indie pop", "Blacksburg"], :title=>"Letting Go"}}
        end

        def info_description_data
          {:track=>{:album=>{}, :artist=>{:name=>"Wild Nothing"}, :audio=>{:link=>"https://bandcamp.com/stream_redirect?enc=mp3-128&track_id=1709958085&ts=1612821027&t=0f4b4af0db342b163602532f59606a9d5f23f36c", :present=>true, :source=>"bandcamp"}, :description=>"From Jack Tatum: “There were a number of songs that were kicking when I was finishing Indigo and ‘Blue Wings’ was very nearly included. I had sent the album off to mastering, but the song didn't sit right with me and I decided, at the last possible moment, to leave it off the album. It's intentionally a very bittersweet sounding song. I asked Ben Talmi who did the string arrangements on ‘Shadow’ to help out...", :id=>1, :image=>{:extrasmall=>"https://f4.bcbits.com/img/a3861181658_42.jpg", :large=>"https://f4.bcbits.com/img/a3861181658_5.jpg", :medium=>"https://f4.bcbits.com/img/a3861181658_4.jpg", :original=>"https://f4.bcbits.com/img/a3861181658_10.jpg", :small=>"https://f4.bcbits.com/img/a3861181658_3.jpg"}, :length=>225, :tags=>["Rock", "indie", "indie pop", "Blacksburg"], :title=>"Blue Wings"}}
        end
      end
    end
  end
end
