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
          return minimal_data if @args[:minimal]

          muffon_data
            .merge(artist_data)
        end

        def minimal_data
          { name: }
        end

        def artist_data
          {
            name:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def name
          artist.css(
            '.big-artist-list-title'
          )[0].text
        end

        def artist
          @args[:artist]
        end
      end
    end
  end
end
