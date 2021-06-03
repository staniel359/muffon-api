require 'rails_helper'

RSpec.describe Bandcamp::Id::Album do
  subject { described_class }

  describe 'successful processing' do
    context 'when album present' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/id/album/success' do
          subject.call(artist: 'wildnothingct', album: 'indigo')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Id.album_data) }
    end
  end

  describe 'no processing' do
    context 'when no album' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/id/album/wrong_title' do
          subject.call(artist: 'wildnothingct', album: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
