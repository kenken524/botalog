# アプリケーション名

**Botalog**

# アプリケーション概要

観葉植物、盆栽、塊根植物などの育成方法、育成環境を記録し植物の生育過程を楽しむ。
<br>ユーザー同士でコミュニケーションをとり、より良い育成方法を共有しあえる。

# URL

https://botalog.onrender.com/
<br>※初アクセスの際、サーバー立ち上げのために画面表示に時間がかかる場合がございます。

# テスト用アカウント

- basic認証パスワード:2222
- basic認証ID:admin

ユーザー1

- メールアドレス:testuser@test
- パスワード:test1234
  ユーザー2
- メールアドレス:testuser@test
- パスワード:test1234
  ※メッセージ、フォロー等、コミュニケーションのため2アカウントを用意しています。
  新規でユーザー登録もできます。

# 利用方法

## 植物登録、育成記録

トップページのヘッダーからユーザー新規登録をする。
[![Image from Gyazo](https://i.gyazo.com/204eca3ea8697febb1e3867c749548ea.gif)](https://gyazo.com/204eca3ea8697febb1e3867c749548ea)

トップページまたは、フッターの植物登録ボタンから現在育てている観葉植物、塊根植物、盆栽などを登録する。（ログイン必須）
[![Image from Gyazo](https://i.gyazo.com/7b8f35f1166974525b33c38caca29f34.gif)](https://gyazo.com/7b8f35f1166974525b33c38caca29f34)

トップページまたは、フッターの育成記録ボタンから登録した植物の育成記録を登録する。
[![Image from Gyazo](https://i.gyazo.com/94c4120f51469003b87d7e87f1331a2e.gif)](https://gyazo.com/94c4120f51469003b87d7e87f1331a2e)

登録した植物や育成記録を写真一覧で見ることにより植物の成長を楽しむ。
[![Image from Gyazo](https://i.gyazo.com/953e71b10a505250c73ba16bc443d54e.gif)](https://gyazo.com/953e71b10a505250c73ba16bc443d54e)

[![Image from Gyazo](https://i.gyazo.com/22434a1417f463853786879f5891f5ef.gif)](https://gyazo.com/22434a1417f463853786879f5891f5ef)

## ユーザーコミュニケーション

ユーザーをフォローしたり、投稿に対していいねやブックマークをする。
[![Image from Gyazo](https://i.gyazo.com/6e877c31c4a3012c171099f002408a73.gif)](https://gyazo.com/6e877c31c4a3012c171099f002408a73)

投稿に対してコメントをする。
[![Image from Gyazo](https://i.gyazo.com/97b68b772b3a40277f9c8f57af4f4f7e.gif)](https://gyazo.com/97b68b772b3a40277f9c8f57af4f4f7e)

マイページで自身の投稿やブックマーク、フォローユーザー等が一覧表示される。
[![Image from Gyazo](https://i.gyazo.com/a1b391635a34b4b4dcf790309cf10492.gif)](https://gyazo.com/a1b391635a34b4b4dcf790309cf10492)

メッセージでコミュニケーションをとる。
[![Image from Gyazo](https://i.gyazo.com/0b65c604f006cb5c486979959c8576b9.gif)](https://gyazo.com/0b65c604f006cb5c486979959c8576b9)

# アプリケーションを作成した背景

自分自身の趣味が園芸で、始める際にどのように育成を始めれば良いのか調べるのが大変だったことがきっかけ。
<br>他者の植物や育成記録を一覧で見ることができればより育成方法が学びやすいと考えた。
<br>また同じ趣味のユーザー同士でコミュニケーションを取ることで園芸をより楽しく続けていけると考えアプリケーション作成に至った。

# 洗い出した要件

https://docs.google.com/spreadsheets/d/1eD7ZiGhF3MCuHVAng_Yr95TcZNLPs6KZ-NXJPyaTmLU/edit?usp=sharing

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/0f48794f2a698d34b24394d24657e957.png)](https://gyazo.com/0f48794f2a698d34b24394d24657e957)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/63ca3bcb58adb3866ea5e2f7c4848946.png)](https://gyazo.com/63ca3bcb58adb3866ea5e2f7c4848946)

# 開発環境

- Ruby
- Ruby on Rails
- MySQL
- postgresql
- GitHub
- Render
- Visual Studio Code
- draw.io
- bootstrap
- fontawesome
- aws s3

# ローカルでの動作方法

以下のコマンドを順に実行
<br> % git clone https://github.com/kenken524/botalog.git
<br> % cd botalog
<br> % bundle install
<br> % yarn install

# 工夫したポイント

・全体的にユーザー目線で操作しやすいデザインを意識した。
・アイコンなどfontawesomeを使用しデザインした。
・タブを使用しできるだけ画面の遷移を少なく投稿を一覧で見れるようにした。
・画像のリサイズや、サムネイルデザインなどトレンドのSNSを参考に設定した。
・コメントやLIKE、ブックマークボタンはajaxで非同期通信で反映させた。
・メッセージ機能では送信後、javascriptでスクロールし最新のメッセージ位置まですぐ移動するよう実装した。
