module Spec
  module Helpers
    module AmazonMusic
      module Track
        def amazonmusic_track_info_data
          {track: {album: {source: {id: "B0H8FJP2VK", name: "amazonmusic"}, title: "Gemini [Explicit]"}, artist: {name: "Wild Nothing"}, artists: [{name: "Wild Nothing", source: {id: "B002ZXIYRG", name: "amazonmusic"}}], audio: {link: "http://localhost:4001/media/audio/amazonmusic/B0H8FG4WV2.mp4", present: true}, duration: 199, image: {extrasmall: "https://m.media-amazon.com/images/I/61VcVy2aCNL._UR50,50_.jpg", large: "https://m.media-amazon.com/images/I/61VcVy2aCNL._UR600,600_.jpg", medium: "https://m.media-amazon.com/images/I/61VcVy2aCNL._UR300,300_.jpg", original: "https://m.media-amazon.com/images/I/61VcVy2aCNL._UR1000,1000_.jpg", small: "https://m.media-amazon.com/images/I/61VcVy2aCNL._UR100,100_.jpg"}, listeners_count: 0, player_id: "1-B0H8FG4WV2", profiles_count: 0, source: {id: "B0H8FG4WV2", links: {original: "https://music.amazon.co.uk/tracks/B0H8FG4WV2", streaming: "https://song.link/a/B0H8FG4WV2"}, name: "amazonmusic"}, title: "Chinatown"}}
        end

        def amazonmusic_track_links_data
          {:track=>{:links=>{:original=>"https://music.amazon.co.uk/tracks/B0H8FG4WV2", :streaming=>"https://song.link/a/B0H8FG4WV2"}}}
        end

        def amazonmusic_track_albums_data
          {track: {albums: [{artist: {name: "Wild Nothing"}, artists: [{name: "Wild Nothing", source: {id: "B002ZXIYRG", name: "amazonmusic"}}], image: {extrasmall: "https://m.media-amazon.com/images/I/61VcVy2aCNL._UR50,50_.jpg", large: "https://m.media-amazon.com/images/I/61VcVy2aCNL._UR600,600_.jpg", medium: "https://m.media-amazon.com/images/I/61VcVy2aCNL._UR300,300_.jpg", original: "https://m.media-amazon.com/images/I/61VcVy2aCNL._UR1000,1000_.jpg", small: "https://m.media-amazon.com/images/I/61VcVy2aCNL._UR100,100_.jpg"}, release_date: "2010-05-25", source: {id: "B0H8FJP2VK", links: {original: "https://music.amazon.co.uk/albums/B0H8FJP2VK", streaming: "https://album.link/a/B0H8FJP2VK"}, name: "amazonmusic"}, title: "Gemini"}], artist: {name: "Wild Nothing"}, artists: [{name: "Wild Nothing", source: {id: "B002ZXIYRG", name: "amazonmusic"}}], source: {id: "B0H8FG4WV2", links: {original: "https://music.amazon.co.uk/tracks/B0H8FG4WV2", streaming: "https://song.link/a/B0H8FG4WV2"}, name: "amazonmusic"}, title: "Chinatown"}}
        end
      end
    end
  end
end
