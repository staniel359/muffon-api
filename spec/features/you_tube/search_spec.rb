require 'rails_helper'

RSpec.describe YouTube::Search do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'youtube/search/success' do
          subject.call(query: 'wild nothing chinatown', limit: 5)
        end
      end

      it { expect(output).to eq(Helpers::YouTube.search_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::YouTube.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'youtube/search/wrong_query' do
          subject.call(query: Helpers::YouTube::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::YouTube.not_found_error) }
    end
  end
end
