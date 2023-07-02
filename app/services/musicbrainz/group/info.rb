module MusicBrainz
  module Group
    class Info < MusicBrainz::Group::Base
      MODEL_NAME = 'release-group'.freeze

      include MusicBrainz::Utils::Album

      private

      def params
        super
          .merge(group_params)
      end

      def group_params
        { inc: 'artist-credits+tags' }
      end

      def group_data
        group_base_data
          .merge(group_extra_data)
          .merge(with_more_data)
      end

      def group_base_data
        {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:
        }
      end

      def group_extra_data
        {
          image: image_data,
          release_date:,
          listeners_count:,
          tags: tags_truncated,
          description:
            description_truncated
        }.compact_blank
      end

      def description
        @description ||=
          MusicBrainz::Group::Description.call(
            group_id: @args[:group_id]
          ).dig(
            :group, :description
          )
      end

      alias album response_data
    end
  end
end
