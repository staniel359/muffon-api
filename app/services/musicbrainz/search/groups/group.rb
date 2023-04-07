module MusicBrainz
  module Search
    class Groups
      class Group < MusicBrainz::Search::Groups
        include MusicBrainz::Utils::Album

        def call
          data
        end

        private

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
            artist: artist_names_data,
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
