module LastFM
  module Tag
    class Artists
      class Artist < LastFM::Tag::Artists
        include LastFM::Utils::Artist

        def call
          data
        end

        private

        def data
          return artist_minimal_data if @args[:minimal]

          muffon_data
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

        def image_data
          image_data_formatted(
            image
          )
        end

        def image
          artist['image']
        end

        def listeners_count
          artist['listeners'].to_i
        end
      end
    end
  end
end
