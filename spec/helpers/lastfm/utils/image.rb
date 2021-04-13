module Helpers
  module LastFM
    module Utils
      module Image
        class << self
          def no_args_data
            {:original=>"", :large=>"", :medium=>"", :small=>"", :extrasmall=>""}
          end

          def no_artist_data
            {:original=>"https://lastfm.freetls.fastly.net/i/u/2a96cbd8b46e442fc41c2b86b821562f.png", :large=>"https://lastfm.freetls.fastly.net/i/u/600x600/2a96cbd8b46e442fc41c2b86b821562f.png", :medium=>"https://lastfm.freetls.fastly.net/i/u/300x300/2a96cbd8b46e442fc41c2b86b821562f.png", :small=>"https://lastfm.freetls.fastly.net/i/u/174s/2a96cbd8b46e442fc41c2b86b821562f.png", :extrasmall=>"https://lastfm.freetls.fastly.net/i/u/64s/2a96cbd8b46e442fc41c2b86b821562f.png"}
          end

          def no_album_data
            {:original=>"https://lastfm.freetls.fastly.net/i/u/c6f59c1e5e7240a4c0d427abd71f3dbb.png", :large=>"https://lastfm.freetls.fastly.net/i/u/600x600/c6f59c1e5e7240a4c0d427abd71f3dbb.png", :medium=>"https://lastfm.freetls.fastly.net/i/u/300x300/c6f59c1e5e7240a4c0d427abd71f3dbb.png", :small=>"https://lastfm.freetls.fastly.net/i/u/174s/c6f59c1e5e7240a4c0d427abd71f3dbb.png", :extrasmall=>"https://lastfm.freetls.fastly.net/i/u/64s/c6f59c1e5e7240a4c0d427abd71f3dbb.png"}
          end

          def artist_image
            'https://lastfm.freetls.fastly.net/i/u/avatar170s/22f79109136549c1afb6942d06b56b7c.png'
          end

          def artist_image_data
            {:original=>"https://lastfm.freetls.fastly.net/i/u/22f79109136549c1afb6942d06b56b7c.png", :large=>"https://lastfm.freetls.fastly.net/i/u/600x600/22f79109136549c1afb6942d06b56b7c.png", :medium=>"https://lastfm.freetls.fastly.net/i/u/300x300/22f79109136549c1afb6942d06b56b7c.png", :small=>"https://lastfm.freetls.fastly.net/i/u/174s/22f79109136549c1afb6942d06b56b7c.png", :extrasmall=>"https://lastfm.freetls.fastly.net/i/u/64s/22f79109136549c1afb6942d06b56b7c.png"}
          end

          def similar_image
            'https://lastfm.freetls.fastly.net/i/u/300x300/5d865aa73b99476fbdb374b20adb3105.png'
          end

          def similar_image_data
            {:original=>"https://lastfm.freetls.fastly.net/i/u/5d865aa73b99476fbdb374b20adb3105.png", :large=>"https://lastfm.freetls.fastly.net/i/u/600x600/5d865aa73b99476fbdb374b20adb3105.png", :medium=>"https://lastfm.freetls.fastly.net/i/u/300x300/5d865aa73b99476fbdb374b20adb3105.png", :small=>"https://lastfm.freetls.fastly.net/i/u/174s/5d865aa73b99476fbdb374b20adb3105.png", :extrasmall=>"https://lastfm.freetls.fastly.net/i/u/64s/5d865aa73b99476fbdb374b20adb3105.png"}
          end

          def album_data
            {"name"=>"Gemini", "artist"=>"Wild Nothing", "mbid"=>"98174762-4674-4382-827f-db7248c4806c", "url"=>"https://www.last.fm/music/Wild+Nothing/Gemini", "image"=>[{"#text"=>"https://lastfm.freetls.fastly.net/i/u/34s/c60a738cd2244da9bc2b44b51d643602.png", "size"=>"small"}, {"#text"=>"https://lastfm.freetls.fastly.net/i/u/64s/c60a738cd2244da9bc2b44b51d643602.png", "size"=>"medium"}, {"#text"=>"https://lastfm.freetls.fastly.net/i/u/174s/c60a738cd2244da9bc2b44b51d643602.png", "size"=>"large"}, {"#text"=>"https://lastfm.freetls.fastly.net/i/u/300x300/c60a738cd2244da9bc2b44b51d643602.png", "size"=>"extralarge"}, {"#text"=>"https://lastfm.freetls.fastly.net/i/u/300x300/c60a738cd2244da9bc2b44b51d643602.png", "size"=>"mega"}, {"#text"=>"https://lastfm.freetls.fastly.net/i/u/300x300/c60a738cd2244da9bc2b44b51d643602.png", "size"=>""}], "listeners"=>"302209", "playcount"=>"7133107", "tracks"=>{"track"=>[{"name"=>"Live In Dreams", "url"=>"https://www.last.fm/music/Wild+Nothing/_/Live+In+Dreams", "duration"=>"206", "@attr"=>{"rank"=>"1"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}, {"name"=>"Summer Holiday", "url"=>"https://www.last.fm/music/Wild+Nothing/_/Summer+Holiday", "duration"=>"243", "@attr"=>{"rank"=>"2"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}, {"name"=>"Drifter", "url"=>"https://www.last.fm/music/Wild+Nothing/_/Drifter", "duration"=>"213", "@attr"=>{"rank"=>"3"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}, {"name"=>"Pessimist", "url"=>"https://www.last.fm/music/Wild+Nothing/_/Pessimist", "duration"=>"110", "@attr"=>{"rank"=>"4"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}, {"name"=>"O, Lilac", "url"=>"https://www.last.fm/music/Wild+Nothing/_/O,+Lilac", "duration"=>"182", "@attr"=>{"rank"=>"5"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}, {"name"=>"Bored Games", "url"=>"https://www.last.fm/music/Wild+Nothing/_/Bored+Games", "duration"=>"241", "@attr"=>{"rank"=>"6"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}, {"name"=>"Confirmation", "url"=>"https://www.last.fm/music/Wild+Nothing/_/Confirmation", "duration"=>"193", "@attr"=>{"rank"=>"7"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}, {"name"=>"My Angel Lonely", "url"=>"https://www.last.fm/music/Wild+Nothing/_/My+Angel+Lonely", "duration"=>"178", "@attr"=>{"rank"=>"8"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}, {"name"=>"The Witching Hour", "url"=>"https://www.last.fm/music/Wild+Nothing/_/The+Witching+Hour", "duration"=>"247", "@attr"=>{"rank"=>"9"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}, {"name"=>"Chinatown", "url"=>"https://www.last.fm/music/Wild+Nothing/_/Chinatown", "duration"=>"209", "@attr"=>{"rank"=>"10"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}, {"name"=>"Our Composition Book", "url"=>"https://www.last.fm/music/Wild+Nothing/_/Our+Composition+Book", "duration"=>"228", "@attr"=>{"rank"=>"11"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}, {"name"=>"Gemini", "url"=>"https://www.last.fm/music/Wild+Nothing/_/Gemini", "duration"=>"325", "@attr"=>{"rank"=>"12"}, "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}}]}, "tags"=>{"tag"=>[{"name"=>"2010", "url"=>"https://www.last.fm/tag/2010"}, {"name"=>"dream pop", "url"=>"https://www.last.fm/tag/dream+pop"}, {"name"=>"best of 2010", "url"=>"https://www.last.fm/tag/best+of+2010"}, {"name"=>"indie pop", "url"=>"https://www.last.fm/tag/indie+pop"}, {"name"=>"indie", "url"=>"https://www.last.fm/tag/indie"}]}}
          end

          def album_image_data
            {:original=>"https://lastfm.freetls.fastly.net/i/u/c60a738cd2244da9bc2b44b51d643602.png", :large=>"https://lastfm.freetls.fastly.net/i/u/600x600/c60a738cd2244da9bc2b44b51d643602.png", :medium=>"https://lastfm.freetls.fastly.net/i/u/300x300/c60a738cd2244da9bc2b44b51d643602.png", :small=>"https://lastfm.freetls.fastly.net/i/u/174s/c60a738cd2244da9bc2b44b51d643602.png", :extrasmall=>"https://lastfm.freetls.fastly.net/i/u/64s/c60a738cd2244da9bc2b44b51d643602.png"}
          end

          def track_data
            {"name"=>"Chinatown", "mbid"=>"9a74b1e7-a7a9-46fc-8ad3-58306fdac86f", "url"=>"https://www.last.fm/music/Wild+Nothing/_/Chinatown", "duration"=>"209000", "streamable"=>{"#text"=>"0", "fulltrack"=>"0"}, "listeners"=>"208646", "playcount"=>"1225189", "artist"=>{"name"=>"Wild Nothing", "mbid"=>"a181595e-5b84-4439-a5f4-f548ddfb64df", "url"=>"https://www.last.fm/music/Wild+Nothing"}, "album"=>{"artist"=>"Wild Nothing", "title"=>"Gemini", "mbid"=>"98174762-4674-4382-827f-db7248c4806c", "url"=>"https://www.last.fm/music/Wild+Nothing/Gemini", "image"=>[{"#text"=>"https://lastfm.freetls.fastly.net/i/u/34s/c60a738cd2244da9bc2b44b51d643602.png", "size"=>"small"}, {"#text"=>"https://lastfm.freetls.fastly.net/i/u/64s/c60a738cd2244da9bc2b44b51d643602.png", "size"=>"medium"}, {"#text"=>"https://lastfm.freetls.fastly.net/i/u/174s/c60a738cd2244da9bc2b44b51d643602.png", "size"=>"large"}, {"#text"=>"https://lastfm.freetls.fastly.net/i/u/300x300/c60a738cd2244da9bc2b44b51d643602.png", "size"=>"extralarge"}], "@attr"=>{"position"=>"10"}}, "toptags"=>{"tag"=>[{"name"=>"dream pop", "url"=>"https://www.last.fm/tag/dream+pop"}, {"name"=>"indie", "url"=>"https://www.last.fm/tag/indie"}, {"name"=>"chillwave", "url"=>"https://www.last.fm/tag/chillwave"}, {"name"=>"shoegaze", "url"=>"https://www.last.fm/tag/shoegaze"}, {"name"=>"electronica", "url"=>"https://www.last.fm/tag/electronica"}]}}
          end

          def track_image_data
            {:original=>"https://lastfm.freetls.fastly.net/i/u/c60a738cd2244da9bc2b44b51d643602.png", :large=>"https://lastfm.freetls.fastly.net/i/u/600x600/c60a738cd2244da9bc2b44b51d643602.png", :medium=>"https://lastfm.freetls.fastly.net/i/u/300x300/c60a738cd2244da9bc2b44b51d643602.png", :small=>"https://lastfm.freetls.fastly.net/i/u/174s/c60a738cd2244da9bc2b44b51d643602.png", :extrasmall=>"https://lastfm.freetls.fastly.net/i/u/64s/c60a738cd2244da9bc2b44b51d643602.png"}
          end
        end
      end
    end
  end
end