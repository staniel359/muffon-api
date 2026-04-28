module Discogs
  module Label
    class Albums
      class Album < Discogs::Label::Albums
        include Discogs::Mixins::Album

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
          raw_album_data['artists'] = [
            { 'name' => raw_artist_name }
          ]

          Muffon::Formatter::Source::Label::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: discogs_id,
            source_model: discogs_model,
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

        def raw_artist_name
          raw_album_data['artist']
        end

        def image_url
          raw_album_data['thumb']
        end
      end
    end
  end
end
