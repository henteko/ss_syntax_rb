require "spec_helper"

describe SsSyntax::Parses::Character do

  describe 'self.check' do
    context 'when character' do
      it '*' do
        expect(SsSyntax::Parses::Character.check('* hoge fuga')).to be_truthy
        expect(SsSyntax::Parses::Character.check('* hoge')).to be_truthy
      end

      it '-' do
        expect(SsSyntax::Parses::Character.check('- hoge fuga')).to be_truthy
        expect(SsSyntax::Parses::Character.check('- hoge')).to be_truthy
      end
    end

    context 'when not character' do
      it 'comment' do
        expect(SsSyntax::Parses::Character.check('# hoge')).to be_falsey
      end

      it 'heart voice' do
        expect(SsSyntax::Parses::Character.check('1_ hoge')).to be_falsey
      end

      it 'remark' do
        expect(SsSyntax::Parses::Character.check('1: hoge')).to be_falsey
      end

      it 'blank' do
        expect(SsSyntax::Parses::Character.check('')).to be_falsey
      end
    end
  end

  describe 'self.get' do
    context 'when character' do
      before do
        @cha  = 'hoge'
        @cha2 = 'fuga'
      end

      it '*' do
        expect(SsSyntax::Parses::Character.get("* #{@cha} #{@cha2}")).to match_array [@cha, @cha2]
      end

      it '-' do
        expect(SsSyntax::Parses::Character.get("- #{@cha} #{@cha2}")).to match_array [@cha, @cha2]
      end
    end

    context 'when nil' do
      before do
        @cha  = 'hoge'
      end

      it '*' do
        expect(SsSyntax::Parses::Character.get("* #{@cha}")).to match_array [nil, nil]
      end

      it '-' do
        expect(SsSyntax::Parses::Character.get("- #{@cha}")).to match_array [nil, nil]
      end
    end
  end
end