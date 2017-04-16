# Rspecメモ

**公式ドキュメント**

[http://rspec.info/](http://rspec.info/)
[http://www.relishapp.com/rspec](http://www.relishapp.com/rspec)


## matcher

**公式ドキュメントのmatcher一覧**

[http://www.relishapp.com/rspec/rspec-expectations/v/3-5/docs/built-in-matchers](http://www.relishapp.com/rspec/rspec-expectations/v/3-5/docs/built-in-matchers)

**イコール**

```
例:  expect(calc.add(2, 3)).to eq(5)
```

**Not イコール**

```
例:  expect(calc.add(2, 3)).not_to eq(5)
```

**true**

```
例:  expect(calc.add(2, 3)).to be true
```

**false**

```
例:  expect(calc.add(2, 3)).to be false
```

**大きい小さい**

```
例:  expect(calc.add(2, 3)).to be > 10
```

**範囲指定**

```
例:  expect(calc.add(2, 3)).to be_between(1, 10).inclusive
```

**特定のメソッドが存在するか**

引数にシンボルでメソッド名を渡す

```
例:  expect(calc).to respond_to(:add)
```

**数値かどうか**

```
例1:  expect(calc.add(2, 3).integer?).to be true #integer? empty?

例2:  expect(calc.add(2, 3)).to be_integer
```
