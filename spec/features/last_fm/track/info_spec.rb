require 'rails_helper'

RSpec.describe LastFM::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and track exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/info/success' do
          subject.call(
            artist_name: 'kate bush',
            track_title: 'hounds of love'
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM.track_info_data) }
    end
  end

  describe 'no processing' do
    let(:not_found_data) { Helpers::LastFM.not_found_data }

    context 'when no track title given' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/info/no_track_title' do
          subject.call(artist_name: 'kate bush')
        end
      end

      it { expect(output).to eq(not_found_data) }
    end

    context 'when wrong track title' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/info/wrong_track_title' do
          subject.call(
            artist_name: 'kate bush',
            track_title: Helpers::LastFM::RANDOM_STRING
          )
        end
      end

      it { expect(output).to eq(not_found_data) }
    end
  end
end
