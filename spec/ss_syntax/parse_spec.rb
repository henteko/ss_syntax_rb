require "spec_helper"

describe SsSyntax::Parse do

  before do
    @text = <<"EOS"
* 1 hoge
* 2 fuga

# comment
1: hoge
2_ fuga
EOS
  end

  describe '#to_s' do
    it 'default' do
      re_text = <<"EOS"

hoge「hoge」
fuga（fuga）
EOS

      expect(SsSyntax::Parse.new(@text).to_s).to eq re_text
    end
  end

  describe '#to_h' do
    it 'default' do
      re_html = "<br /><p>hoge「hoge」</p><br /><p>fuga（fuga）</p><br />"

      expect(SsSyntax::Parse.new(@text).to_h).to eq re_html
    end
  end

end