require 'rails_helper'

RSpec.describe Genius::Artist::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when id present' do
      let(:output) do
        VCR.use_cassette 'services/genius/artist/albums/success' do
          subject.call(artist_id: '3490', limit: 5, page: 2)
        end
      end

      it { expect(output).to eq(Helpers::Genius::Artist.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong id' do
      let(:output) do
        VCR.use_cassette 'services/genius/artist/albums/wrong_id' do
          subject.call(artist_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
