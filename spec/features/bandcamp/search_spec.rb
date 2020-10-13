require 'rails_helper'

RSpec.describe Bandcamp::Search do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'bandcamp/search/success' do
          subject.call(query: 'wild nothing indigo')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp.search_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Bandcamp.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'bandcamp/search/wrong_query' do
          subject.call(query: Helpers::Bandcamp::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp.not_found_error) }
    end
  end
end
