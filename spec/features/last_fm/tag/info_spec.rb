require 'rails_helper'

RSpec.describe LastFM::Tag::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when tag exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/tag/info/success' do
          subject.call(tag: 'dream pop')
        end
      end

      it { expect(output).to eq(Helpers::LastFM.tag_info_data) }
    end
  end

  describe 'no processing' do
    let(:not_found_error) { Helpers::LastFM.not_found_error }

    context 'when no tag name given' do
      let(:output) do
        VCR.use_cassette 'lastfm/tag/info/no_name' do
          subject.call(tag: nil)
        end
      end

      it { expect(output).to eq(not_found_error) }
    end

    context 'when wrong tag name' do
      let(:output) do
        VCR.use_cassette 'lastfm/tag/info/wrong_name' do
          subject.call(tag: Helpers::LastFM::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(not_found_error) }
    end
  end
end
