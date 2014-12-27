require "spec_helper"

describe SsSyntax::Parses::Comment do

  describe 'self.check' do
    context 'when comment' do
      it 'default' do
        expect(SsSyntax::Parses::Comment.check('# hoge')).to be_truthy
      end

      it 'many #' do
        expect(SsSyntax::Parses::Comment.check('## hoge ######')).to be_truthy
      end
    end

    context 'when not comment' do
      it 'default' do
        expect(SsSyntax::Parses::Comment.check('hoge')).to be_falsey
      end

      it 'character' do
        expect(SsSyntax::Parses::Comment.check('* hoge')).to be_falsey
      end

      it 'remark' do
        expect(SsSyntax::Parses::Comment.check('1: hoge')).to be_falsey
      end

      it 'heart voice' do
        expect(SsSyntax::Parses::Comment.check('1_ hoge')).to be_falsey
      end
    end
  end

end