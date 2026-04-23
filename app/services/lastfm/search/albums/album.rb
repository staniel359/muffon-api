module LastFM
  module Search
    class Albums
      class Album < LastFM::Search::Albums
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

          Muffon::Formatter::Search::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: nil,
            title:,
            artists:,
            image_data:,
            release_date: nil,
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
