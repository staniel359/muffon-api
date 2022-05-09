module LastFM
  module Top
    class Albums
      class Album < LastFM::Top::Albums
        include LastFM::Utils::Album

        def call
          data
        end

        private

        def data
          update_listeners_count

          muffon_data
            .merge(album_data)
        end

        def update_listeners_count
          find_album.update(
            listeners_count:
              album[:listeners_count].to_i
          )
        end

        def album
          @args[:album]
        end

        def album_data
          {
            source_id:,
            title:,
            artist: artist_names_data,
            artists:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def image
          album['image']
        end
      end
    end
  end
end
