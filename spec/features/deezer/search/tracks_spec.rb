require 'rails_helper'

RSpec.describe Deezer::Search::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'deezer/search/tracks/success' do
          subject.call(query: 'a', limit: 5, page: 2)
        end
      end

      it { expect(output).to eq(Helpers::Deezer::Search.tracks_data) }
    end
  end

  describe 'no processing' do
    context 'when no query' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'deezer/search/tracks/wrong_query' do
          subject.call(query: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end