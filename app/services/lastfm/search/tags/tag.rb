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
            raw_tag_data
          ]
        end

        def data
          { name: raw_tag_data.name }
        end

        def raw_tag_data
          @args[:raw_tag_data]
        end
      end
    end
  end
end
