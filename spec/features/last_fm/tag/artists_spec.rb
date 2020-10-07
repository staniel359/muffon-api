require 'rails_helper'

RSpec.describe LastFM::Tag::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when tag exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/tag/artists/success' do
          subject.call(tag: 'dream pop')
        end
      end

      it { expect(output).to eq(Helpers::LastFM.tag_artists_data) }
    end
  end

  describe 'no processing' do
    let(:not_found_data) { Helpers::LastFM.not_found_data }

    context 'when no tag name given' do
      let(:output) do
        VCR.use_cassette 'lastfm/tag/artists/no_tag_name' do
          subject.call(tag: nil)
        end
      end

      it { expect(output).to eq(not_found_data) }
    end

    context 'when wrong tag name' do
      let(:output) do
        VCR.use_cassette 'lastfm/tag/artists/wrong_tag_name' do
          subject.call(tag: Helpers::LastFM::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(not_found_data) }
    end
  end
end
