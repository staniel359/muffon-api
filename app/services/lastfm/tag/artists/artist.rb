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
          muffon_data.merge(artist_data)
        end

        def artist_data
          {
            id: id,
            name: name,
            image: image_data,
            listeners_count: listeners_count
          }.compact
        end

        def name
          @args.artist.css(
            '.big-artist-list-title'
          )[0].text
        end
      end
    end
  end
end
