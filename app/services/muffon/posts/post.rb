module Muffon
  module Posts
    class Post < Muffon::Base
      def call
        data
      end

      private

      def data
        post_base_data
          .merge(post_extra_data)
      end

      def post_base_data
        {
          id: post.id,
          profile: profile_data,
          by_community: post.by_community?,
          community: community_data,
          post_type: post.post_type,
          content: post.content
        }.compact
      end

      def post
        @args[:post]
      end

      def profile_data
        {
          id: profile.id,
          nickname: profile.nickname,
          image: profile.image_data
        }
      end

      def profile
        @profile ||= post.profile
      end

      def community_data
        return if community.blank?

        {
          id: community.id,
          title: community.title,
          image: community.image_data
        }
      end

      def community
        @community ||= post.community
      end

      def post_extra_data
        {
          images:,
          artists:,
          albums:,
          tracks:,
          created: created_formatted
        }.compact
      end

      def images
        post.images_data
      end

      def artists_list
        post.artists
      end

      def artist_data_formatted(artist)
        Muffon::Sendable::Artist.call(
          artist:
        )
      end

      def albums_list
        post.albums
      end

      def album_data_formatted(album)
        Muffon::Sendable::Album.call(
          album:
        )
      end

      def tracks_list
        post.tracks
      end

      def track_data_formatted(track)
        Muffon::Sendable::Track.call(
          track:
        )
      end

      def created_formatted
        datetime_formatted(
          post.created_at
        )
      end
    end
  end
end
