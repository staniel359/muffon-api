module MusixMatch
  module Album
    class Info < MusixMatch::Album::Base
      include MusixMatch::Utils::Album

      private

      def link
        "#{BASE_LINK}/album.get"
      end

      def album_data
        if @args[:list]
          album_list_data
        else
          album_full_data
        end
      end

      def album_full_data
        self_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_list_data
        self_data
          .merge(album_base_data)
          .merge(album_list_extra_data)
      end

      def album_base_data
        {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:
        }.compact
      end

      def album_extra_data
        {
          release_date:,
          listeners_count:,
          tags: tags_truncated,
          tracks:
        }.compact
      end

      def album_list_extra_data
        {
          release_date:,
          listeners_count:
        }.compact
      end

      def tags_truncated
        collection_truncated(
          tags,
          size: 'extrasmall'
        )
      end

      def raw_tags
        album.dig(
          'primary_genres',
          'music_genre_list'
        )
      end

      def tag_name_formatted(tag)
        tag.dig(
          'music_genre',
          'music_genre_name'
        )
      end

      def tracks
        MusixMatch::Album::Tracks.call(
          album_id: @args[:album_id],
          profile_id: @args[:profile_id],
          token: @args[:token]
        ).dig(
          :album,
          :tracks
        )
      end
    end
  end
end
