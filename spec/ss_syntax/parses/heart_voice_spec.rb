require "spec_helper"

describe SsSyntax::Parses::HeartVoice do

  describe 'self.check' do
    context 'when heart voice' do
      it 'default' do
        expect(SsSyntax::Parses::HeartVoice.check('1_ hoge')).to be_truthy
      end
    end

    context 'when not heart voice' do
      it 'default' do
        expect(SsSyntax::Parses::HeartVoice.check('hoge')).to be_falsey
      end

      it 'character' do
        expect(SsSyntax::Parses::HeartVoice.check('* hoge')).to be_falsey
      end

      it 'comment' do
        expect(SsSyntax::Parses::HeartVoice.check('# hoge')).to be_falsey
      end

      it 'remark' do
        expect(SsSyntax::Parses::HeartVoice.check('1: hoge')).to be_falsey
      end

      it 'blank' do
        expect(SsSyntax::Parses::HeartVoice.check('')).to be_falsey
      end
    end
  end

  describe 'self.get' do
    before do
      @characters = {
          '1' => 'hoge'
      }
    end

    context 'when remark' do
      it 'default' do
        text = '1_ hoge'
        re_text = 'hoge（hoge）'
        expect(SsSyntax::Parses::HeartVoice.get(text, @characters)).to eq re_text
      end

      it 'not character' do
        text = 'fuga_ hoge'
        re_text = 'fuga（hoge）'
        expect(SsSyntax::Parses::HeartVoice.get(text, @characters)).to eq re_text
      end
    end
  end

end