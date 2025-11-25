module LastFM
  module Artist
    class Info < LastFM::Artist::Base
      private

      def params
        {
          **super,
          **language_params
        }
      end

      def artist_data
        update_listeners_count!

        {
          **self_data,
          source: source_data,
          name:,
          listeners_count:,
          plays_count:,
          profiles_count:,
          image: image_data,
          description:
            description_truncated,
          tags: tags_truncated,
          recommendation:
            recommendation_data,
          **with_more_data
        }.compact
      end

      def update_listeners_count!
        find_artist.update!(
          listeners_count:
            raw_listeners_count
        )
      end

      def raw_listeners_count
        artist.dig(
          'stats',
          'listeners'
        ).to_i
      end

      def plays_count
        artist
          .dig(
            'stats',
            'playcount'
          )
          .to_i
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
      end

      def description
        description_formatted(
          raw_description
        )
      end

      def raw_description
        artist.dig(
          'bio',
          'content'
        )
      end

      def tags_truncated
        collection_truncated(
          tags,
          size: 'extrasmall'
        )
      end

      def raw_tags
        artist.dig(
          'tags',
          'tag'
        )
      end

      def recommendation_data
        LastFM::Artist::Info::Recommendation.call(
          profile_id: @args[:profile_id],
          token: @args[:token],
          artist_name: name
        )
      end
    end
  end
end
