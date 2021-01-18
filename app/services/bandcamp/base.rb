module Bandcamp
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if invalid_link? || no_data?

      yield if block_given?

      data
    end

    private

    def primary_args
      [@args.link]
    end

    def invalid_link?
      @args.link && @args.link[bandcamp_link_regexp].blank?
    end

    def bandcamp_link_regexp
      %r{(https?://)*\w+(?:-\w+)*.bandcamp.com/
        (?:album|track)/(\w|-)+(?:-\w+)*}x
    end

    def no_data?
      scripts.blank?
    end

    def scripts
      @scripts ||= response_data.css('script')
    end

    def response_data
      Nokogiri::HTML.parse(response)
    end

    def response
      RestClient.get(@args.link)
    end

    def base_data
      @base_data ||= JSON.parse(scripts[0])
    end

    def extra_data
      @extra_data ||= JSON.parse(scripts[3]['data-tralbum'])
    end

    def tracks_data
      @tracks_data ||= extra_data['trackinfo']
    end

    def images
      {
        original: image,
        large: image.sub('_10', '_5'),
        medium: image.sub('_10', '_4'),
        small: image.sub('_10', '_3'),
        extrasmall: image.sub('_10', '_42')
      }
    end

    def image
      "https://f4.bcbits.com/img/a#{extra_data['art_id']}_10.jpg"
    end

    def artist_name
      base_data.dig('byArtist', 'name')
    end

    def track_title
      base_data['name']
    end
  end
end
