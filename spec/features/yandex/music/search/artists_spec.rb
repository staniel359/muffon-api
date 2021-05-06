require 'rails_helper'

RSpec.describe Yandex::Music::Search::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'yandex/music/search/artists/success' do
          subject.call(query: 'a', page: 2)
        end
      end

      it { expect(output).to eq(Helpers::Yandex::Music::Search.artists_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'yandex/music/search/artists/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
