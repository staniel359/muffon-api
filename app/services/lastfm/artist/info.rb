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
          .merge(artist_base_data)
          .merge(artist_counters_data)
          .merge(artist_extra_data)
          .merge(with_more_data)
      end

      def update_listeners_count
        find_artist.update(
          listeners_count: artist.dig(
            'stats', 'listeners'
          ).to_i
        )
      end

      def artist_base_data
        {
          source: source_data,
          name:
        }
      end

      def artist_counters_data
        {
          listeners_count:,
          plays_count:,
          profiles_count:
        }.compact
      end

      def profiles_count
        return if Rails.env.test?

        find_artist
          .profiles
          .size
      end

      def plays_count
        artist.dig(
          'stats', 'playcount'
        ).to_i
      end

      def artist_extra_data
        {
          description:
            description_truncated,
          tags: tags_truncated,
          recommendation:
            recommendation_data
        }.compact
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
