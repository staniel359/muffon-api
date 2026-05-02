module LastFM
  module Top
    class Albums
      class Album < LastFM::Base
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
          update_album_record!

          Muffon::Formatter::Source::Top::Albums::Album.call(
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

        def image_url
          raw_album_data['image']
        end
      end
    end
  end
end
