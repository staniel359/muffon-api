module VK
  module Search
    class Tracks
      class Track < VK::Search::Tracks
        def call
          track_data
        end

        private

        def track_data
          _, _, _, title, artist, length = @args.track

          {
            title: CGI.unescapeHTML(title),
            artist: CGI.unescapeHTML(artist),
            length: length,
            audio_id: audio_id
          }
        end

        def audio_id
          hashes = @args.track[13].split('/')

          "#{@args.track[1]}_#{@args.track[0]}_#{hashes[2]}_#{hashes[5]}"
        end
      end
    end
  end
end
