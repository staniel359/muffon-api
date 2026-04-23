module LastFM
  module Tag
    class Albums
      class Album < LastFM::Tag::Albums
        include Muffon::Utils::Album
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
          update_record_data!

          Muffon::Formatter::Tag::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: nil,
            title:,
            artists:,
            image_data:,
            **self_args
          )
        end

        def raw_album_data
          @args[:raw_album_data]
        end

        def artist_name
          raw_album_data.dig(
            'artist',
            'name'
          )
        end
      end
    end
  end
end
