require 'rails_helper'

RSpec.describe LastFM::Search::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'lastfm/search/albums/success' do
          subject.call(query: 'wild nothing nocturne', limit: 5)
        end
      end

      it { expect(output).to eq(Helpers::LastFM.search_albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no query' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::LastFM.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'lastfm/search/albums/wrong_query' do
          subject.call(query: Helpers::LastFM::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::LastFM.not_found_error) }
    end
  end
end
