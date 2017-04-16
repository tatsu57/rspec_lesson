require 'calc'

# @note shared_examplesを使うと共通の実装を共有できる(mix-in的な)
# @note 文字列がメソッド名のなる
RSpec.shared_examples "basic functions" do
  it "can add"
  it "can subtrace"
  it "can multipy"
  it "can devide"
end


# @note トップレベルの文字列はテスト対象のクラス名を書く場合あり
RSpec.describe Calc do

  # # @note beforeは引数を省略すると明示的に:exampleになる
  # # @note :exampleは各テストの前に実行されるオプション
  # # @note :contextは現在のブロックの中で一度だけ実行される
  # before do
  #   # @note :exampleをまたがってテストを実行する場合は@をつけてインスタンス変数にする。非推奨
  #   @calc = Calc.new
  # end

  # # @note doubleでモデルやメソッドなど未実装のモノがある前提でテストを書く場合に有効(代役オブジェクト)
  # it {
  #   user = double('user')
  #   allow(user).to receive(:name).and_return('taguchi')
  #   calc = Calc.new
  #   expect(calc.add_name(5, 2, user.name)).to eq('7 by taguchi')
  # }

  # # @note subjectは操作の対象インスタンスを指定でき、シンボルを引数として、各contextで使える
  # # @note beforeはインスタンス変数になり、非推奨なため、subjectを使う
  subject(:calc){Calc.new}

  # @note 下位レベルではRspecは不要
  # @note 状況だった場合はcontextになる。describeでも可
  context "when normal mode" do

    # @note itはexample / specifyにすることも可。英語の文脈に合うモノを選ぶ
    it "given 2 and 3, returns 5" do
      expect(calc.add(2,3)).to eq(5)
    end

    # @note itの後に続く文字列は省略可。Rpecがいい感じに補完してくれる
    it {expect(calc.add(5, 8)).to eq(13)}

    # @note itの後にブロックを作らず、文字列を渡すとpeddingになり、テスト対象から外れる
    it "draws graph"
  end

  context "tax 5%" do
    # @note letはexampleごとに結果がキャッシュされる(変数のようなもの)
    # @note letは遅延評価される
    # @note let!とすると、即実行される
    let!(:tax) {calc.tax = 0.05}
    it {expect(tax).to eq(0.05)}
    it {expect(calc.price(100)).to eq(105)}
  end

  context "when graph mode" do
    it "draw graph" do
    end
  end

  # @note include_examplesでshared_examplesを呼び出せる
  context "normal mode" do
    include_examples "basic functions"
  end

  context "expert mode" do
    include_examples "basic functions"
    it "can draw graph"
  end
end
