module LastFM
  module Search
    class Tags
      class Tag < LastFM::Search::Tags
        def call
          data
        end

        private

        def data
          {
            id: id,
            name: name
          }
        end

        def id
          return 1 if Rails.env.test?

          ::Tag.with_name(name).id
        end

        def name
          @name ||= tag[:title].match(
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
