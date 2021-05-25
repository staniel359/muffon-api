require 'rails_helper'

RSpec.describe Discogs::Artist::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist_id given' do
      let(:output) do
        VCR.use_cassette 'discogs/artist/albums/success' do
          subject.call(artist_id: '6271', album_type: 'album', page: 2)
        end
      end

      it { expect(output).to eq(Helpers::Discogs::Artist.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist_id given' do
      let(:output) { subject.call(album_type: 'album') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when no album_type given' do
      let(:output) { subject.call(artist_id: '6271') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist_id' do
      let(:output) do
        VCR.use_cassette 'discogs/artist/albums/wrong_id' do
          subject.call(artist_id: random, album_type: 'album')
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
