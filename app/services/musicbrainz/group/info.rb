module MusicBrainz
  module Group
    class Info < MusicBrainz::Group::Base
      include MusicBrainz::Mixins::AlbumGroup

      private

      def request_params
        {
          **super,
          inc: 'artist-credits+tags'
        }
      end

      def group_data
        Muffon::Formatter::Source::AlbumGroup::Info.call(
          source_original_link:,
          source_name:,
          source_album_group_id: musicbrainz_id,
          source_model: musicbrainz_model,
          title:,
          artists:,
          image_data:,
          release_date:,
          description:,
          tags:,
          tags_size: 'extrasmall',
          tracks: nil,
          **self_args
        )
      end

      def description
        MusicBrainz::Group::Description.call(
          group_id: @args[:group_id]
        ).dig(
          :group,
          :description
        )
      end
    end
  end
end
