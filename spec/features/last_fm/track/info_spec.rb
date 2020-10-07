require 'rails_helper'

RSpec.describe LastFM::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and track exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/info/success' do
          subject.call(
            artist: 'kate bush', track: 'hounds of love'
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM.track_info_data) }
    end
  end

  describe 'no processing' do
    let(:not_found_error) { Helpers::LastFM.not_found_error }

    context 'when no track title given' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/info/no_track_title' do
          subject.call(artist: 'kate bush')
        end
      end

      it { expect(output).to eq(not_found_error) }
    end

    context 'when wrong track title' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/info/wrong_track_title' do
          subject.call(
            artist: 'kate bush',
            track: Helpers::LastFM::RANDOM_STRING
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end
  end
end
