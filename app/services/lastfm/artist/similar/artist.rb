module LastFM
  module Artist
    class Similar
      class Artist < LastFM::Artist::Similar
        prepend LastFM::Utils::Artist

        def call
          data
        end

        private

        def data
          return minimal_data if @args[:minimal]

          muffon_data
            .merge(artist_data)
        end

        def minimal_data
          { name: }
        end

        def artist
          @artist ||= @args[:artist]
        end

        def artist_data
          {
            name:,
            image: image_data,
            listeners_count:
          }.compact
        end
      end
    end
  end
end
