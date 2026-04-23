module Spec
  module Helpers
    module Bandcamp
      module Track
        def bandcamp_track_albums_data
          {track: {albums: [{artist: {name: "Wild Nothing"}, artists: [{name: "Wild Nothing", source: {id: 2228040235, name: "bandcamp"}}], image: {extrasmall: "https://f4.bcbits.com/img/a3221996752_42.jpg", large: "https://f4.bcbits.com/img/a3221996752_5.jpg", medium: "https://f4.bcbits.com/img/a3221996752_4.jpg", original: "https://f4.bcbits.com/img/a3221996752_10.jpg", small: "https://f4.bcbits.com/img/a3221996752_3.jpg"}, release_date: "2018-08-31", source: {artist_id: 2228040235, id: 452973411, links: {original: "https://wildnothingct.bandcamp.com/album/indigo", streaming: "https://album.link/b/452973411"}, model: "album", name: "bandcamp"}, title: "Indigo"}], artist: {name: "Wild Nothing"}, artists: [{name: "Wild Nothing", source: {id: 2228040235, name: "bandcamp"}}], source: {artist_id: 2228040235, id: 2723372494, links: {original: "https://wildnothingct.bandcamp.com/track/letting-go"}, model: "track", name: "bandcamp"}, title: "Letting Go"}}
        end

        def bandcamp_track_description_data
          {:track=>{:description=>"From Jack Tatum: “There were a number of songs that were kicking when I was finishing Indigo and ‘Blue Wings’ was very nearly included. I had sent the album off to mastering, but the song didn't sit right with me and I decided, at the last possible moment, to leave it off the album. It's intentionally a very bittersweet sounding song. I asked Ben Talmi who did the string arrangements on ‘Shadow’ to help out with this very simple dissonant string part I was hearing in my head which is now my favorite element in the track. It's a song about walking through to the other side of crippling self-doubt with the help of someone you love. It's a reminder to myself not to let things spiral, hard as it may be at times.”"}}
        end

        def bandcamp_track_info_album_data
          {track: {album: {source: {artist_id: 2228040235, id: 452973411, name: "bandcamp"}, title: "Indigo"}, artist: {name: "Wild Nothing"}, artists: [{name: "Wild Nothing", source: {id: 2228040235, name: "bandcamp"}}], audio: {link: "https://bandcamp.com/stream_redirect?enc=mp3-128&track_id=2723372494&ts=1776808303&t=9c62cdf7ffd4e233a396508ce0e40da4a0148e2c", present: true}, duration: 221, image: {extrasmall: "https://f4.bcbits.com/img/a3221996752_42.jpg", large: "https://f4.bcbits.com/img/a3221996752_5.jpg", medium: "https://f4.bcbits.com/img/a3221996752_4.jpg", original: "https://f4.bcbits.com/img/a3221996752_10.jpg", small: "https://f4.bcbits.com/img/a3221996752_3.jpg"}, listeners_count: 0, player_id: "1-2723372494", profiles_count: 0, source: {artist_id: 2228040235, id: 2723372494, links: {original: "https://wildnothingct.bandcamp.com/track/letting-go"}, model: "track", name: "bandcamp"}, tags: [{name: "Rock"}, {name: "indie"}, {name: "indie pop"}, {name: "Blacksburg"}], title: "Letting Go", with_more: {tags: false}}}
        end

        def bandcamp_track_info_description_data
          {track: {artist: {name: "Wild Nothing"}, artists: [{name: "Wild Nothing", source: {id: 2228040235, name: "bandcamp"}}], audio: {link: "https://bandcamp.com/stream_redirect?enc=mp3-128&track_id=1709958085&ts=1776808306&t=82be65e0c8d7fc37ec15506638a1f0f78421239c", present: true}, description: "From Jack Tatum: “There were a number of songs that were kicking when I was finishing Indigo and ‘Blue Wings’ was very nearly included. I had sent the album off to mastering, but the song didn't sit right with me and I decided, at the last possible moment, to leave it off the album. It's intentionally a very bittersweet sounding song. I asked Ben Talmi who did the string arrangements on ‘Shadow...", duration: 225, image: {extrasmall: "https://f4.bcbits.com/img/a3861181658_42.jpg", large: "https://f4.bcbits.com/img/a3861181658_5.jpg", medium: "https://f4.bcbits.com/img/a3861181658_4.jpg", original: "https://f4.bcbits.com/img/a3861181658_10.jpg", small: "https://f4.bcbits.com/img/a3861181658_3.jpg"}, listeners_count: 0, player_id: "1-1709958085", profiles_count: 0, source: {artist_id: 2228040235, id: 1709958085, links: {original: "https://wildnothingct.bandcamp.com/track/blue-wings"}, model: "track", name: "bandcamp"}, tags: [{name: "Rock"}, {name: "indie"}, {name: "indie pop"}, {name: "Blacksburg"}], title: "Blue Wings", with_more: {description: true, tags: false}}}
        end

        def bandcamp_track_links_data
          {track: {links: {original: "https://wildnothingct.bandcamp.com/track/blue-wings"}}}
        end

        def bandcamp_track_tags_data
          {:track=>{:tags=>[{:name=>"Rock"}, {:name=>"indie"}, {:name=>"indie pop"}, {:name=>"Blacksburg"}]}}
        end
      end
    end
  end
end
