require 'rails_helper'

RSpec.describe LastFM::Utils::Image do
  subject { described_class }

  describe 'successful processing' do
    context 'when no args' do
      let(:output) { subject.call }
      let(:result) { Helpers::LastFM::Utils::Image.no_args_data }

      it { expect(output).to eq(result) }
    end

    context 'when no artist data' do
      let(:output) { subject.call(model: 'artist') }
      let(:result) { Helpers::LastFM::Utils::Image.no_artist_data }

      it { expect(output).to eq(result) }
    end

    context 'when no album data' do
      let(:output) { subject.call(model: 'album') }
      let(:result) { Helpers::LastFM::Utils::Image.no_album_data }

      it { expect(output).to eq(result) }
    end

    context 'when artist' do
      let(:image) { Helpers::LastFM::Utils::Image.artist_image }
      let(:output) { subject.call(model: 'artist', image: image) }
      let(:result) { Helpers::LastFM::Utils::Image.artist_image_data }

      it { expect(output).to eq(result) }
    end

    context 'when similar artist' do
      let(:image) { Helpers::LastFM::Utils::Image.similar_image }
      let(:output) { subject.call(model: 'artist', image: image) }
      let(:result) { Helpers::LastFM::Utils::Image.similar_image_data }

      it { expect(output).to eq(result) }
    end

    context 'when album' do
      let(:data) { Helpers::LastFM::Utils::Image.album_data }
      let(:output) { subject.call(model: 'album', data: data) }
      let(:result) { Helpers::LastFM::Utils::Image.album_image_data }

      it { expect(output).to eq(result) }
    end

    context 'when track' do
      let(:data) { Helpers::LastFM::Utils::Image.track_data['album'] }
      let(:output) { subject.call(model: 'album', data: data) }
      let(:result) { Helpers::LastFM::Utils::Image.track_image_data }

      it { expect(output).to eq(result) }
    end
  end
end
