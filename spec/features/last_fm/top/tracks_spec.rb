require 'rails_helper'

RSpec.describe LastFM::Top::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when no primary args' do
      let(:output) do
        VCR.use_cassette 'lastfm/top/tracks/success' do
          subject.call(limit: 10)
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Top.tracks_data) }
    end
  end
end
