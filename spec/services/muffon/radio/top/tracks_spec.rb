RSpec.describe Muffon::Radio::Top::Tracks do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette 'services/muffon/radio/top/tracks/success' do
        subject.call
      end
    end

    it { expect(output).to eq(Helpers::Muffon::Radio::Top.tracks_data) }
  end
end
