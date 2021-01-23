require 'rails_helper'

RSpec.describe Discogs::Album::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_id given' do
      let(:output) do
        VCR.use_cassette 'discogs/album/info/success' do
          subject.call(album_id: '197163')
        end
      end

      it { expect(output).to eq(Helpers::Discogs::Album.info_data) }
    end

    context 'when multiple artists' do
      let(:output) do
        VCR.use_cassette 'discogs/album/info/multiple_artists' do
          subject.call(album_id: '13812684')
        end
      end

      it do
        expect(output).to eq(
          Helpers::Discogs::Album.info_multiple_artists_data
        )
      end
    end

    context 'when different artists' do
      let(:output) do
        VCR.use_cassette 'discogs/album/info/different_artists' do
          subject.call(album_id: '546618')
        end
      end

      it do
        expect(output).to eq(
          Helpers::Discogs::Album.info_different_artists_data
        )
      end
    end
  end

  describe 'no processing' do
    context 'when no album_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album_id' do
      let(:output) do
        VCR.use_cassette 'discogs/album/info/wrong_id' do
          subject.call(album_id: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
