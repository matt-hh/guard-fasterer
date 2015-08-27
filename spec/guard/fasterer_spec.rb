require 'guard/compat/test/helper'
require 'guard/fasterer'

RSpec.describe Guard::Fasterer do
  let(:options) { {} }
  subject { described_class.new(options) }

  describe '#start' do
    context 'without run_on_start option' do
      it 'does not run' do
        expect(Kernel).to_not receive(:system)
        subject.start
      end
    end

    context 'with run_on_start set to true' do
      let(:options) { { run_on_start: true } }
      it 'runs' do
        expect(Kernel).to receive(:system).with('bundle exec fasterer')
        subject.start
      end
    end

    context 'with run_on_start set to false' do
      let(:options) { { run_on_start: false } }
      it 'does not run' do
        expect(Kernel).to_not receive(:system)
        subject.start
      end
    end
  end

  describe '#run_all' do
    it 'runs' do
      expect(Kernel).to receive(:system).with('bundle exec fasterer')
      subject.run_all
    end
  end

  describe '#run_on_change' do
    it 'runs' do
      expect(Kernel).to receive(:system).with('bundle exec fasterer')
      subject.run_all
    end
  end
end
