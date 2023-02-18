# Nagano_Cake
 
Ruby on Railsを使用して制作したショッピングサイト
 
# 概要

ケーキのネット販売を目的としている
ユーザーは、店舗(admin)、購入希望者(customer)を想定
※未ログイン状態でも商品の閲覧は可能

# 苦労した点
* enum管理およびその日本語化
* 注文から購入確定までのデータの受け渡し
* 注文履歴詳細でステータスの更新を1画面に複数実装したこと

# Note
 ##管理者側の機能
  /admin/sign_in から管理者用ログインページへ遷移
  /nagano_cake/db/seeds.rb ID/PWは左記参照