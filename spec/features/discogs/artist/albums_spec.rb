require 'rails_helper'

RSpec.describe Discogs::Artist::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist_id given' do
      let(:output) do
        VCR.use_cassette 'discogs/artist/albums/success' do
          subject.call(artist_id: '1771611', page: 2, limit: 5)
        end
      end

      it { expect(output).to eq(Helpers::Discogs::Artist.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist_id' do
      let(:output) do
        VCR.use_cassette 'discogs/artist/albums/wrong_id' do
          subject.call(artist_id: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
