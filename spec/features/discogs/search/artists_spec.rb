require 'rails_helper'

RSpec.describe Discogs::Search::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when query string given' do
      let(:output) do
        VCR.use_cassette 'discogs/search/artists/success' do
          subject.call(query: 'kate bush', limit: 5, page: 2)
        end
      end

      it { expect(output).to eq(Helpers::Discogs::Search.artists_data) }
    end
  end

  describe 'no processing' do
    context 'when no query string given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query string' do
      let(:output) do
        VCR.use_cassette 'discogs/search/artists/wrong_query' do
          subject.call(query: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
