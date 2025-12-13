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
          { name: tag.name }
        end

        def tag
          @args[:tag]
        end
      end
    end
  end
end
