module Bing
  class Search < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

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
      @results ||= response_data.css('.b_algo')
    end

    def response_data
      @response_data ||= Nokogiri::HTML.parse(response)
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
        first: offset,
        count: limit
      }
    end

    def offset
      return if @args.page.to_i.zero?

      ((@args.page.to_i - 1) * limit) + 1
    end

    def limit
      (@args.limit || 20).to_i
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        page: page,
        results: results_data
      }
    end

    def page
      return 1 if current_page_block.blank?

      current_page_block.text.to_i
    end

    def current_page_block
      @current_page_block ||= response_data.css('.sb_pagS')[0]
    end

    def results_data
      results.map { |r| result_data(r) }
    end

    def result_data(result)
      Bing::Search::Result.call(result: result)
    end
  end
end
