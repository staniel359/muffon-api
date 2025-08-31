module Spec
  module Helpers
    module YandexMusic
      module Track
        def yandexmusic_track_albums_data
          {:track=>{:albums=>[{:artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>777542, :name=>"yandexmusic"}}], :image=>{:extrasmall=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/50x50", :large=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/600x600", :medium=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/300x300", :original=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/1000x1000", :small=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/100x100"}, :listeners_count=>274504, :release_date=>"2012", :source=>{:id=>6999409, :links=>{:original=>"https://music.yandex.ru/album/6999409", :streaming=>"https://album.link/ya/6999409"}, :name=>"yandexmusic"}, :title=>"Nocturne"}], :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>777542, :name=>"yandexmusic"}}], :player_id=>"1-4780792", :source=>{:id=>4780792, :links=>{:original=>"https://music.yandex.ru/track/4780792", :streaming=>"https://song.link/ya/4780792"}, :name=>"yandexmusic"}, :title=>"Only Heather"}}
        end

        def yandexmusic_track_info_data
          {:track=>{:album=>{:source=>{:id=>6999409, :name=>"yandexmusic"}, :title=>"Nocturne"}, :artist=>{:name=>"Wild Nothing"}, :artists=>[{:name=>"Wild Nothing", :source=>{:id=>777542, :name=>"yandexmusic"}}], :audio=>{:link=>"https://s79vla.storage.yandex.net/get-mp3/66acdafdb3658ab37d13986c81199439/00061d22d503f184/rmusic/U2FsdGVkX19sAtCTr-bQWt7TTrlRamSZ-1TZwHfQ1s6WQZLTwruIPCHsuckjkSA9EMlm1oPv7boBq-idEe8YLry6yiysm-lO-pQLXO4VaHc/af73c72b68cfc09a43060223dc2054b090df0f2248d0d78d7251f0765322a73a/5335", :present=>true}, :duration=>193, :image=>{:extrasmall=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/50x50", :large=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/600x600", :medium=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/300x300", :original=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/1000x1000", :small=>"https://avatars.yandex.net/get-music-content/117546/ff9f700f.a.6999409-1/100x100"}, :player_id=>"1-4780792", :source=>{:id=>4780792, :links=>{:original=>"https://music.yandex.ru/track/4780792", :streaming=>"https://song.link/ya/4780792"}, :name=>"yandexmusic"}, :title=>"Only Heather"}}
        end

        def yandexmusic_track_links_data
          {:track=>{:links=>{:original=>"https://music.yandex.ru/track/2203363", :streaming=>"https://song.link/ya/2203363"}}}
        end
      end
    end
  end
end
