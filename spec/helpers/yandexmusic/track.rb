module Spec
  module Helpers
    module YandexMusic
      module Track
        def yandexmusic_track_albums_data
          {:track=>{:albums=>[{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>777542, :name=>"yandexmusic"}}], :image=>{:extrasmall=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/50x50", :large=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/600x600", :medium=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/300x300", :original=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/1000x1000", :small=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/100x100"}, :release_date=>"2012", :source=>{:id=>6999409, :links=>{:original=>"https://music.yandex.ru/album/6999409", :streaming=>"https://album.link/ya/6999409"}, :name=>"yandexmusic"}, :title=>"Nocturne"}], :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>777542, :name=>"yandexmusic"}}], :source=>{:id=>4780792, :links=>{:original=>"https://music.yandex.ru/track/4780792", :streaming=>"https://song.link/ya/4780792"}, :name=>"yandexmusic"}, :title=>"Only Heather"}}
        end

        def yandexmusic_track_info_data
          {track: {album: {source: {id: 19220440, name: "yandexmusic"}, title: "The Family Jewels (Deluxe)"}, artist: {name: "MARINA"}, artists: [{name: "MARINA", source: {id: 140285, name: "yandexmusic"}}], audio: {link: "https://strm-spbmiran-23.strm.yandex.net/music-v2/raw/ysign1=707e0169788ad9346cd2b42e4ce27d00c32dbceb8e5365e2f8c1bbf811601bf7,lid=24,pfx,secret_version=ver-1,sfx,source=mds,ts=6a0419b8/0/4674110/73c48b53.196426683.3.533871/aac192-mp4", present: true}, duration: 204, image: {extrasmall: "https://avatars.yandex.net/get-music-content/5314916/1f9e65fb.a.19220440-1/50x50", large: "https://avatars.yandex.net/get-music-content/5314916/1f9e65fb.a.19220440-1/600x600", medium: "https://avatars.yandex.net/get-music-content/5314916/1f9e65fb.a.19220440-1/300x300", original: "https://avatars.yandex.net/get-music-content/5314916/1f9e65fb.a.19220440-1/1000x1000", small: "https://avatars.yandex.net/get-music-content/5314916/1f9e65fb.a.19220440-1/100x100"}, listeners_count: 0, player_id: "1-533871", profiles_count: 0, source: {id: 533871, links: {original: "https://music.yandex.ru/track/533871", streaming: "https://song.link/ya/533871"}, name: "yandexmusic"}, title: "Hollywood"}}
        end

        def yandexmusic_track_links_data
          {:track=>{:links=>{:original=>"https://music.yandex.ru/track/2203363", :streaming=>"https://song.link/ya/2203363"}}}
        end
      end
    end
  end
end
