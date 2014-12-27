require "spec_helper"

describe SsSyntax::Parses::None do

  describe 'self.check' do
    context 'always return true' do
      it 'blank' do
        expect(SsSyntax::Parses::None.check('')).to be_truthy
      end

      it 'default' do
        expect(SsSyntax::Parses::None.check('hoge')).to be_truthy
      end
    end
  end

  describe 'self.get' do
    context 'always return text' do
      it 'blank' do
        text = ''
        expect(SsSyntax::Parses::None.get(text)).to eq(text)
      end

      it 'default' do
        text = 'hoge'
        expect(SsSyntax::Parses::None.get(text)).to eq(text)
      end
    end
  end

end