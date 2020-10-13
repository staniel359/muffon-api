module Bing
  class Search < Muffon::Base
    def call
      return bad_request_error if not_all_args?
      return not_found_error if no_data?

      data
    end

    private

    def primary_args
      [@args.query]
    end

    def no_data?
      results.blank?
    end

    def results
      @results ||= parsed_response.css('.b_algo')
    end

    def parsed_response
      @parsed_response ||= Nokogiri::HTML.parse(response)
    end

    def response
      RestClient.get(bing_link, params: params)
    end

    def bing_link
      'https://www.bing.com/search'
    end

    def params
      {
        q: @args.query,
        first: first,
        count: count
      }
    end

    def first
      return if @args.page.to_i.zero?

      ((@args.page - 1) * 20) + 1
    end

    def count
      @args.limit || 20
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        results: results_data,
        page: page
      }
    end

    def results_data
      results.map do |r|
        {
          title: r.css('.b_title a')[-2].text,
          link: r.css('.b_title a')[-2]['href'],
          description: r.css('.b_caption p').text
        }
      end
    end

    def page
      parsed_response.css('.sb_pagS')[0].text.to_i
    end
  end
end
