module Bandcamp
  class ID < Bandcamp::Base
    private

    def primary_args
      [@args.link]
    end

    def no_data?
      response_data.blank? || model_data.blank?
    end

    def response_data
      @response_data ||=
        Nokogiri::HTML.parse(response).css('script')
    end

    def link
      @args.link
    end

    def model_data
      if album_or_track?
        response_data[3]['data-tralbum']
      else
        response_data[2]['data-band'] ||
          response_data[3]['data-band']
      end
    end

    def album_or_track?
      @args.link.match?(%r{/album|track/})
    end

    def data
      {
        type: model_type,
        id: parsed_model_data['id'],
        artist_id: artist_id
      }.compact
    end

    def model_type
      if album_or_track?
        parsed_model_data['item_type']
      else
        parsed_model_data['is_label'] ? 'label' : 'artist'
      end
    end

    def parsed_model_data
      @parsed_model_data ||= JSON.parse(model_data)
    end

    def artist_id
      return unless album_or_track?

      parsed_model_data.dig('current', 'band_id')
    end
  end
end
