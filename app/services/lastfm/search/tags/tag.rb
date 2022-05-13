module LastFM
  module Search
    class Tags
      class Tag < LastFM::Search::Tags
        def call
          data
        end

        private

        def data
          { name: }
        end

        def name
          tag[:title].match(
            /(.+) music | Last.fm/
          )[1].downcase
        end

        def tag
          @args[:tag]
        end
      end
    end
  end
end
