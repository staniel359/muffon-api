module Discogs
  module Mixins
    module AlbumGroup
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_album_group_data['title']
      end

      def discogs_id
        raw_album_group_data['id']
      end

      def discogs_model
        'group'
      end

      def group_id
        raw_album_group_data['main_release']
      end

      def source_original_link
        "https://www.discogs.com/master/#{discogs_id}"
      end

      def raw_artists
        (raw_album_group_data['artists'] || []).map do |raw_artist_data|
          raw_artist_data_formatted(
            raw_artist_data
          )
        end
      end

      def raw_artist_data_formatted(
        raw_artist_data
      )
        {
          name: artist_name_formatted(
            raw_artist_data['name']
          ),
          source_id: raw_artist_data['id']
        }.compact
      end

      def artist_name_formatted(
        name
      )
        name.split(/ \(\d+\)$/)[0]
      end

      def raw_tracks
        raw_album_group_data['tracklist'].select do |raw_track_data|
          raw_track_data['type_'] == 'track'
        end
      end

      def image_data
        Discogs::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        (primary_image_url || raw_images[0]).try(:[], 'uri')
      end

      def primary_image_url
        raw_images.find do |raw_image_data|
          raw_image_data['type'] == 'primary'
        end
      end

      def raw_images
        raw_album_group_data['images']
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_group_data['year'].to_s
      end

      def raw_tags
        raw_album_group_data
          .values_at(
            'genres',
            'styles'
          )
          .flatten
          .compact
          .uniq
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data
      end

      def description
        Discogs::Formatter::Description.call(
          description: raw_description
        )
      end

      def raw_description
        raw_album_group_data['notes']
      end
    end
  end
end
