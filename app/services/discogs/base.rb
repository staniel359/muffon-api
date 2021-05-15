module Discogs
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    end

    private

    def no_data?
      response_data.blank?
    end

    def response_data
      @response_data ||= JSON.parse(api_response)
    end

    def api_response
      RestClient.get(link, headers)
    end

    def base_link
      'https://api.discogs.com'
    end

    def headers
      { params: params }
    end

    def params
      {
        key: secrets.discogs[:api_key],
        secret: secrets.discogs[:api_secret]
      }
    end

    def artist_name(data)
      data['artists'].map { |a| artist_with_join(a) }.flatten.join
    end

    def artist_with_join(artist)
      [artist['name'], join_data(artist)]
    end

    def join_data(data)
      join = " #{data['join']} "

      return join.strip if data['join'] == ''
      return join.lstrip if data['join'] == ','

      join
    end

    def title
      response_data['title']
    end

    def artist_data(data)
      { name: artist_name(data) }
    end

    def albums_data
      albums_list.map { |a| album_data(a) }
    end

    def albums_list
      response_data['releases'] || response_data['versions']
    end

    def image_data(image, model)
      Discogs::Utils::Image.call(image: image, model: model)
    end

    def main_image
      return if images_list.blank?

      (primary_image || images_list[0])['uri']
    end

    def images_list
      response_data['images']
    end

    def primary_image
      images_list.find { |i| i['type'] == 'primary' }
    end

    def length_formatted(length)
      length.split(':').map(&:to_i).inject { |m, s| m * 60 + s }.to_i
    end

    def description
      desc = response_data['notes'].to_s

      description_rules.each do |rule|
        desc = desc.gsub(rule[0], rule[1])
      end

      desc
    end

    def description_rules
      [
        [/\[a=(.*?)\]/, '\1'],
        [/\[m=(.*?)\]/, 'https://www.discogs.com/master/\1'],
        [/\[.*?\]/, '']
      ]
    end

    def tags_list
      response_data.values_at(
        'genres', 'styles'
      ).flatten.compact.uniq
    end

    def tracks_data
      Discogs::Utils::Tracks.call(response_data: response_data)
    end
  end
end
