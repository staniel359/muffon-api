require 'rails_helper'

RSpec.describe Google::Search do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'google/search/success' do
          subject.call(
            query: 'wild nothing indigo bandcamp'
          )
        end
      end

      it { expect(output).to eq(Helpers::Google.search_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Google.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'google/search/wrong_query' do
          subject.call(query: '*')
        end
      end

      it { expect(output).to eq(Helpers::Google.not_found_error) }
    end
  end
end
