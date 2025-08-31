module MusicBrainz
  module Search
    class Groups
      class Group < MusicBrainz::Search::Groups
        include MusicBrainz::Utils::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            group
          ]
        end

        def data
          self_data
            .merge(album_data)
        end

        def album
          @args[:group]
        end

        def album_data
          {
            source: source_data,
            title:,
            artist: artists_minimal_data,
            artists:,
            image: image_data,
            release_date:,
            listeners_count:
          }.compact_blank
        end
      end
    end
  end
end
