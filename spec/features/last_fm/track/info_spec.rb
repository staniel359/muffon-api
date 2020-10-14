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
    context 'when no track title given' do
      let(:output) { subject.call(artist: 'kate bush') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when no artist name given' do
      let(:output) { subject.call(track: 'hounds of love') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track title' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/info/wrong_title' do
          subject.call(
            artist: 'kate bush',
            track: Helpers::Base::RANDOM_STRING
          )
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'lastfm/track/info/wrong_name' do
          subject.call(
            artist: Helpers::Base::RANDOM_STRING,
            track: 'hounds of love'
          )
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
