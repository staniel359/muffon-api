RSpec.describe Odnoklassniki::Utils::Audio::Link do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id present' do
      let(:output) do
        subject.call(link: 'https://musicd.mycdn.me/v0/stream?id=v0_10036616745_1_1&cid=v0_10036616745_1_1&fid=123042442621275&uid=adf3578376b6dac62fce4aa8dd07f4d6&sid=db816dbd76762014291b86ba27106626fa9ede4f63942aaa6c73b8d99963cb60656aaa22c24ac130445e2237809e819ae94baa74021bceb22a2857c9b0e31c57&ts=1703946067577&md5=a2cc0a2868822879355e9a9c9c7fb7f3')
      end

      it { expect(output).to eq(Helpers::Odnoklassniki::Utils.audio_link) }
    end
  end

  describe 'no processing' do
    context 'when no track_id' do
      let(:output) { subject.call }

      it { expect(output).to be_nil }
    end

    context 'when wrong track_id' do
      let(:output) do
        subject.call(link: random)
      end

      it { expect(output).to eq(Helpers::Odnoklassniki::Utils.audio_wrong_link) }
    end
  end
end
