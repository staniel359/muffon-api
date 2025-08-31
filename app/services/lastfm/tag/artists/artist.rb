module LastFM
  module Tag
    class Artists
      class Artist < LastFM::Tag::Artists
        include LastFM::Utils::Artist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            artist
          ]
        end

        def data
          return artist_minimal_data if @args[:minimal]

          self_data
            .merge(artist_data)
        end

        def artist_minimal_data
          { name: }
        end

        def name
          artist['name']
        end

        def artist
          @args[:artist]
        end

        def artist_data
          {
            source: source_data,
            name:,
            image: image_data,
            listeners_count:
          }.compact
        end
      end
    end
  end
end
