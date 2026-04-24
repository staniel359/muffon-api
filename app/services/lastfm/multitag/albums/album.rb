module LastFM
  module Multitag
    class Albums
      class Album < LastFM::Multitag::Albums
        include LastFM::Mixins::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_album_data
          ]
        end

        def data
          Muffon::Formatter::Multitag::Albums::Album.call(
            album_record:,
            source_original_link:,
            source_name:,
            source_album_id: nil,
            title:,
            artists:,
            image_data:,
            **self_args
          )
        end

        def album_record
          @args[:raw_album_data]
        end

        def title
          album_record.title
        end

        def artist_name
          album_record.artist.name
        end
      end
    end
  end
end
