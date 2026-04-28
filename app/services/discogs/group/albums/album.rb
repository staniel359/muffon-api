module Discogs
  module Group
    class Albums
      class Album < Discogs::Group::Base
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
          Muffon::Formatter::Source::AlbumGroup::Albums::Album.call(
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

        def artists
          @args[:artists]
        end

        def image_url
          raw_album_data['thumb']
        end

        def raw_release_date
          raw_album_data['released']
        end
      end
    end
  end
end
