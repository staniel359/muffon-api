module LastFM
  module Artist
    class Info < LastFM::Artist::Base
      private

      def params
        super.merge(
          language_params
        )
      end

      def artist_data
        update_listeners_count

        muffon_data
          .merge(base_artist_data)
          .merge(with_more_data)
      end

      def update_listeners_count
        find_artist.update(
          listeners_count: artist.dig(
            'stats', 'listeners'
          ).to_i
        )
      end

      def base_artist_data
        {
          name:,
          listeners_count:,
          plays_count:,
          description:
            description_truncated,
          tags: tags_truncated,
          recommendation:
            recommendation_data
        }.compact
      end

      def plays_count
        artist.dig(
          'stats', 'playcount'
        ).to_i
      end

      def description
        description_formatted(
          raw_description
        )
      end

      def raw_description
        artist.dig(
          'bio', 'content'
        )
      end

      def tags_list
        return [] if artist['tags'].blank?

        [raw_tags_list].flatten
      end

      def raw_tags_list
        artist.dig(
          'tags', 'tag'
        )
      end

      def recommendation_data
        return if Rails.env.test?

        LastFM::Artist::Info::Recommendation.call(
          profile_id: @args[:profile_id],
          artist_name: name
        )
      end
    end
  end
end
