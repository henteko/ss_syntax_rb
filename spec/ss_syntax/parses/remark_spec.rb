require "spec_helper"

describe SsSyntax::Parses::Remark do

  describe 'self.check' do
    context 'when remark' do
      it 'default' do
        expect(SsSyntax::Parses::Remark.check('1: hoge')).to be_truthy
      end
    end

    context 'when not remark' do
      it 'default' do
        expect(SsSyntax::Parses::Remark.check('hoge')).to be_falsey
      end

      it 'character' do
        expect(SsSyntax::Parses::Remark.check('* hoge')).to be_falsey
      end

      it 'comment' do
        expect(SsSyntax::Parses::Remark.check('# hoge')).to be_falsey
      end

      it 'heart voice' do
        expect(SsSyntax::Parses::Remark.check('1_ hoge')).to be_falsey
      end

      it 'blank' do
        expect(SsSyntax::Parses::Remark.check('')).to be_falsey
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
        text = '1: hoge'
        re_text = 'hoge「hoge」'
        expect(SsSyntax::Parses::Remark.get(text, @characters)).to eq re_text
      end

      it 'with gion' do
        text = '1: hoge : zzz'
        re_text = 'hoge「hoge」zzz'
        expect(SsSyntax::Parses::Remark.get(text, @characters)).to eq re_text
      end

      it 'not character' do
        text = 'fuga: hoge'
        re_text = 'fuga「hoge」'
        expect(SsSyntax::Parses::Remark.get(text, @characters)).to eq re_text
      end
    end
  end

end