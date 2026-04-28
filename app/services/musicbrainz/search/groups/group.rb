module MusicBrainz
  module Search
    class Groups
      class Group < MusicBrainz::Search::Groups
        include MusicBrainz::Mixins::AlbumGroup

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_album_group_data
          ]
        end

        def data
          Muffon::Formatter::Source::Search::AlbumGroups::AlbumGroup.call(
            source_original_link:,
            source_name:,
            source_album_group_id: musicbrainz_id,
            source_model: musicbrainz_model,
            title:,
            artists:,
            image_data:,
            release_date:,
            **self_args
          )
        end

        def raw_album_group_data
          @args[:raw_album_group_data]
        end
      end
    end
  end
end
