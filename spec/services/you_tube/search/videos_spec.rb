require 'rails_helper'

RSpec.describe YouTube::Search::Videos do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'services/youtube/search/videos/success' do
          subject.call(query: 'wild nothing chinatown', limit: 5, next_page: 'CAUQAA')
        end
      end

      it { expect(output).to eq(Helpers::YouTube::Search.videos_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'services/youtube/search/videos/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
