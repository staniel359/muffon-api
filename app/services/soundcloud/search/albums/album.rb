module SoundCloud
  module Search
    class Albums
      class Album < SoundCloud::Base
        include SoundCloud::Mixins::Album

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
          Muffon::Formatter::Source::Search::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: soundcloud_id,
            title:,
            artists:,
            image_data:,
            release_date:,
            **self_args
          )
        end

        def raw_album_data
          @args[:raw_album_data]
        end
      end
    end
  end
end
