require 'rails_helper'

RSpec.describe LastFM::Search::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'lastfm/search/tags/success' do
          subject.call(query: 'pop', page: 2)
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Search.tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no query' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'lastfm/search/tags/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
