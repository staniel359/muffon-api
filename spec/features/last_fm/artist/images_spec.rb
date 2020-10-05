require 'rails_helper'

RSpec.describe LastFM::Artist::Images do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette 'lastfm_artist_images_success' do
          subject.call(artist_name: 'wild nothing')
        end
      end

      it { expect(output).to eq(Helpers::LastFM.artist_images_data) }
    end
  end

  describe 'no processing' do
    let(:not_found_data) { Helpers::LastFM.not_found_data }

    context 'when no artist name given' do
      let(:output) do
        VCR.use_cassette 'lastfm_artist_images_no_name' do
          subject.call(artist_name: nil)
        end
      end

      it { expect(output).to eq(not_found_data) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'lastfm_artist_images_wrong_name' do
          subject.call(artist_name: Helpers::LastFM::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(not_found_data) }
    end
  end
end