module Discogs
  class Base < Muffon::Base
    BASE_LINK = 'https://api.discogs.com'.freeze
    SOURCE_NAME = 'discogs'.freeze

    private

    def params
      {
        key: api_key,
        secret: api_secret
      }
    end

    def api_key
      credentials.dig(
        :discogs,
        :api_key
      )
    end

    def api_secret
      credentials.dig(
        :discogs,
        :api_secret
      )
    end

    def artist_data_formatted(
      raw_artist_data
    )
      {
        source: artist_source_data(
          raw_artist_data
        ),
        name: artist_name_formatted(
          raw_artist_data['name']
        )
      }
    end

    def artist_source_data(
      raw_artist_data
    )
      {
        name: source_name,
        id: raw_artist_data['id']
      }
        .compact
    end

    def artist_name_formatted(name)
      name.split(
        / \(\d+\)$/
      )[0]
    end

    def image_data_formatted(image)
      Discogs::Utils::Image.call(
        image:
      )
    end

    def image
      (
        primary_image ||
          images_list[0]
      ).try(:[], 'uri')
    end

    def primary_image
      images_list.find do |i|
        i['type'] == 'primary'
      end
    end

    def images_list
      response_data['images'] || []
    end

    def description
      Discogs::Utils::Description.call(
        description: response_data['notes']
      )
    end

    def model_name
      self.class::MODEL_NAME
    end

    def tag_name_formatted(
      tag_data
    )
      tag_data
    end

    def label_name_formatted(
      raw_label_data
    )
      raw_label_data['name']
    end

    alias artist_name artists_names
  end
end
