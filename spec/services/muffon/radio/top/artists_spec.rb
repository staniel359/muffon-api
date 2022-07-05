RSpec.describe Muffon::Radio::Top::Artists do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette 'services/muffon/radio/top/artists/success' do
        subject.call
      end
    end

    it { expect(output).to eq(Helpers::Muffon::Radio::Top.artists_data) }
  end
end
