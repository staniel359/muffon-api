require 'rails_helper'

RSpec.describe Odnoklassniki::Search::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'odnoklassniki/search/tracks/success' do
          subject.call(query: 'kate bush', limit: 5, page: 2)
        end
      end

      it do
        expect(output).to eq(
          Helpers::Odnoklassniki::Search.tracks_data
        )
      end
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'odnoklassniki/search/tracks/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
