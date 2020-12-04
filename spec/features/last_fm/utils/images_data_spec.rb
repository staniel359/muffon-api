require 'rails_helper'

RSpec.describe LastFM::Utils::ImagesData do
  subject { described_class }

  describe 'successful processing' do
    context 'when no args' do
      let(:output) { subject.call }
      let(:result) { Helpers::LastFM::Utils::ImagesData.no_args_data }

      it { expect(output).to eq(result) }
    end

    context 'when no artist data' do
      let(:output) { subject.call(model: 'artist') }
      let(:result) { Helpers::LastFM::Utils::ImagesData.no_artist_data }

      it { expect(output).to eq(result) }
    end

    context 'when no album data' do
      let(:output) { subject.call(model: 'album') }
      let(:result) { Helpers::LastFM::Utils::ImagesData.no_album_data }

      it { expect(output).to eq(result) }
    end

    context 'when artist' do
      let(:image) { Helpers::LastFM::Utils::ImagesData.artist_image_data }
      let(:output) { subject.call(model: 'artist', image: image) }
      let(:result) { Helpers::LastFM::Utils::ImagesData.artist_images_data }

      it { expect(output).to eq(result) }
    end

    context 'when similar artist' do
      let(:image) { Helpers::LastFM::Utils::ImagesData.similar_image_data }
      let(:output) { subject.call(model: 'artist', image: image) }
      let(:result) { Helpers::LastFM::Utils::ImagesData.similar_images_data }

      it { expect(output).to eq(result) }
    end

    context 'when album' do
      let(:data) { Helpers::LastFM::Utils::ImagesData.album_data }
      let(:output) { subject.call(model: 'album', data: data) }
      let(:result) { Helpers::LastFM::Utils::ImagesData.album_images_data }

      it { expect(output).to eq(result) }
    end

    context 'when track' do
      let(:data) { Helpers::LastFM::Utils::ImagesData.track_data['album'] }
      let(:output) { subject.call(model: 'album', data: data) }
      let(:result) { Helpers::LastFM::Utils::ImagesData.track_images_data }

      it { expect(output).to eq(result) }
    end
  end
end
