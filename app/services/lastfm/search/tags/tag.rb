module LastFM
  module Search
    class Tags
      class Tag < LastFM::Search::Tags
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            tag
          ]
        end

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
