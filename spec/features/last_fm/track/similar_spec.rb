require 'rails_helper'

RSpec.describe LastFM::Track::Similar do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and track exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/similar/success' do
          subject.call(
            artist: 'wild nothing',
            track: 'chinatown', limit: 10
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM.track_similar_data) }
    end
  end

  describe 'no processing' do
    context 'when no track title given' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/similar/no_title' do
          subject.call(artist: 'wild nothing', track: nil)
        end
      end

      it { expect(output).to eq(Helpers::LastFM.bad_request_error) }
    end

    context 'when no artist name given' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/similar/no_name' do
          subject.call(artist: nil, track: 'chinatown')
        end
      end

      it { expect(output).to eq(Helpers::LastFM.bad_request_error) }
    end

    context 'when wrong track title' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/similar/wrong_title' do
          subject.call(
            artist: 'wild nothing',
            track: Helpers::LastFM::RANDOM_STRING
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM.not_found_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/similar/wrong_name' do
          subject.call(
            artist: Helpers::LastFM::RANDOM_STRING,
            track: 'chinatown'
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM.not_found_error) }
    end
  end
end
