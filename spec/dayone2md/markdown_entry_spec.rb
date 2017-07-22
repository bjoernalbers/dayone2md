require 'spec_helper'

module DayOne2MD
  describe MarkdownEntry do
    let(:dir) { 'tmp' }
    let(:file) { 'tmp/2013-03-17 Chunky Bacon.md' }

    before do
      FileUtils.rm(file) if File.exist?(file)
    end

    subject { described_class.new(
      date: DateTime.parse("2013-03-17T10:11:13+00:00"),
      title: "Chunky Bacon",
      content: "hello world",
      dir: dir) }

    describe '#filename' do
      it 'joins date and title' do
        expect(subject.filename).to eq '2013-03-17 Chunky Bacon.md'
      end

      it 'converts slashed into dashes' do
        subject.title = 'Chunky/Bacon'
        expect(subject.filename).to eq '2013-03-17 Chunky-Bacon.md'
      end

      it 'ignores empty title' do
        subject.title = nil
        expect(subject.filename).to eq '2013-03-17.md'
      end
    end

    describe '#date' do
      it 'validates presence' do
        expect(subject).to be_valid
        subject.date = nil
        expect(subject).not_to be_valid
      end
    end

    describe '#save' do
      context 'when valid' do
        it 'creates markdown file' do
          subject.save
          expect(File.exist?(file)).to be true
        end

        it 'writes content to file' do
          subject.save
          expect(File.read(file)).to eq subject.content
        end

        it 'returns true' do
          expect(subject.save).to be true
        end
      end

      context 'when invalid' do
        before do
          allow(subject).to receive(:valid?) { false }
        end

        it 'does not create markdown file' do
          subject.save
          expect(File.exist?(file)).not_to be true
        end

        it 'returns false' do
          expect(subject.save).to be false
        end
      end
    end

    describe '#dir' do
      it 'defaults to current working dir' do
        subject = described_class.new
        expect(subject.dir).to eq Dir.pwd
      end

      it 'is overwritable' do
        subject = described_class.new(dir: dir)
        expect(subject.dir).to eq dir
      end
    end
  end
end
