# PlantUml

## 概要
クラス図やシーケンス図のUMLを
Markdownのようにテキストエディタで記述できる

## インストール方法
### 1.MAC環境
- mac これでうまくいく
  - PlantUMLをAtomで使ってみよう！泣きながらシーケンス図
  http://hige-sun.net/plantuml-on-atom/

- macでクラス図
 ATOM 設定
Package -> Settings View -> Manage Packages -> plantuml-viewer
/usr/local/Cellar/graphviz/2.40.1/bin/dot
- previewが遅い場合
  - 【PlantUML】PlantUMLをAtomエディタでliveプレビューさせてみるメモ for Mac
  http://tweeeety.hateblo.jp/entry/2016/09/02/231909

### 2.Windows環境
- ATOMでPlantUMLを使う
http://get-good-value.com/2017/03/22/【調べ物】atomでplantumlを使う%E3%80%82/

## 記述方法
https://qiita.com/ogomr/items/0b5c4de7f38fd1482a48

## etc
- プレビュー　ショート・カットキー
option+control+p
- ファイル拡張子
.puファイル
- 画像ファイルpng出力方法
java  -Dfile.encoding=UTF-8 -jar ~/Downloads/plantuml.jar ./*pu -o out
