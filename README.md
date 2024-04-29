# FitConnect -フィットコネクト-
​![logo-d4fcc713842ccbd706d9090fdffafb4f785835ec994781813fa867bea5655396](https://github.com/Haruino/fit-connect/assets/156642913/aafc2c94-2fec-4c69-9c11-d04f48890c46)

## サイト概要
### サイトテーマ
筋トレを中心としたフィットネスSNSプラットフォーム。
​
### テーマを選んだ理由
​長時間椅子に座っていたことによる腰痛を筋トレを通して改善した自身の経験から、健康的なライフスタイルの重要性を実感し、特に同じような生活を送るエンジニアやオフィスワーカー、学生に向けて健康への意識を高めるための手段として筋トレを提案したいと考えた。また、コロナ禍での運動不足をきっかけに近年世間的に健康志向が高まっており、大手は10年で3千店超増など格安ジムが増加傾向にあるため、新たに筋トレを始める人が正しい知識を得るための場にもしたいと考えた。体を動かす習慣を身に付けるきっかけを提供し、日本のフィットネス人口を増加させたい。
​
### ターゲットユーザ
・長時間椅子に座るエンジニアやオフィスワーカー、学生<br>
・筋トレやフィットネスに興味があり、これから始めてみたいと思っている人<br>
・自身のトレーニングを共有してモチベーションを上げたい人
​
### 主な利用シーン
・日々のトレーニングメニューの記録と共有したい時<br>
・トレーニングマシンの設定や使い方を確認したい時<br>
・代替種目を探したい時<br>
・トレーニングの記録から、次回の目標を設定して欲しい時<br>
・フィットネスコミュニティで情報交換やモチベーション共有をしたい時
​
## 設計書
### ER図
![2c0716dfcae0ac898e7248bcaa69a8b0](https://github.com/Haruino/fit-connect/assets/156642913/2c8bc9de-9807-405f-ad69-563ac9f5a87d)

### 画面遷移図
#### エンドユーザー側
​![cefe0e5a95b608b24589e44d95ebde3e](https://github.com/Haruino/fit-connect/assets/156642913/daded02b-c824-458d-a90c-39fe436b6d3f)

#### 管理者側
![5ba3d963095d342235cfb689de7b724e](https://github.com/Haruino/fit-connect/assets/156642913/234efbe3-9361-47fd-bb45-a3444f9d4e23)


## 画面プレビュー(一部)
|                                            トップ画面                                                    |                                           ログイン画面                                                   | 
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | 
|![download](https://github.com/Haruino/fit-connect/assets/156642913/f2ae9c4d-5680-4b52-b718-fb490bb296d2)|![download](https://github.com/Haruino/fit-connect/assets/156642913/e9c3196f-209d-4374-b259-ca7f35addc5d)| 

|                                      ブックマーク一覧画面                                                 |                                          フォロー一覧画面                                                 | 
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | 
|![download](https://github.com/Haruino/fit-connect/assets/156642913/150beb33-145a-4c91-bd6a-a4930d29b9fe)|![download](https://github.com/Haruino/fit-connect/assets/156642913/af176d9a-cca3-4aae-93d0-2c78eb249d89)|

|                                           新規登録画面                                                   |                                           マイページ画面                                                 | 
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | 
|![download](https://github.com/Haruino/fit-connect/assets/156642913/c720e784-3471-427c-a96a-0c63da53daf4)|![download](https://github.com/Haruino/fit-connect/assets/156642913/9041444f-d588-41fe-be33-61fcfb47c639)|

|                                          グループ一覧画面                                                 |                                          グループ詳細画面                                                | 
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | 
|![download](https://github.com/Haruino/fit-connect/assets/156642913/c19c055e-799b-44b4-bf50-f7f23f0ba84d)|![download](https://github.com/Haruino/fit-connect/assets/156642913/d12e7182-5f7d-4040-8734-344498adc792)| 

|                                      グループメンバー一覧画面                                             |                                          スレッド詳細画面                                                | 
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | 
|![download](https://github.com/Haruino/fit-connect/assets/156642913/2f246cb1-51c5-4565-bf2a-ea873d6a06bf)|![download](https://github.com/Haruino/fit-connect/assets/156642913/b1fd032c-57ec-4fff-ac43-35107321d33b)| 

|                                         トレーニング記録画面                                              |                                       過去のトレーニング一覧画面                                           | 
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | 
|![download](https://github.com/Haruino/fit-connect/assets/156642913/c42b2e2a-c1e3-4f35-b67b-563ba31b674e)|![download](https://github.com/Haruino/fit-connect/assets/156642913/8bb1e534-bb53-4d28-a6da-b58625cd3d9f)| 

## 使用Gem
```
gem 'devise'
gem 'dotenv-rails'
gem 'kaminari','~> 1.2.1'
gem 'rails-i18n'
```

## 使用方法
### インストール方法
1\.gitからアプリをクローン<br>
`$ git clone git@github.com:Haruino/fit-connect.git`<br>
2\.bundle install<br>
`$ bundle install`<br>
3\.yarn install<br>
`$ yarn install`<br>
4\.データベースをマイグレートする<br>
`$ rails db:migrate`<br>
5\.管理者用にシードデータをインストール<br>
`$ rails db:seed`

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用技術
​[![](https://img.shields.io/badge/Ruby-CC342D?style=flat&logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=flat&logo=ruby-on-rails&logoColor=white)](https://rubyonrails.org/)
[![](https://img.shields.io/badge/HTML-1572B6?style=flat&logo=html5&logoColor=white&color=orange)](https://example.com)
[![](https://img.shields.io/badge/CSS-1572B6?style=flat&logo=css3&logoColor=white)](https://www.w3.org/Style/CSS/Overview.en.html)
[![](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![](https://img.shields.io/badge/Bootstrap-563D7C?style=flat&logo=bootstrap&logoColor=white)](https://getbootstrap.com/)
[![](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/)
[![](https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white)](https://git-scm.com/)
[![](https://img.shields.io/badge/Amazon_AWS-232F3E?style=flat&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![](https://img.shields.io/badge/Amazon_EC2-232F3E?style=flat&logo=amazon-ec2&logoColor=white)](https://aws.amazon.com/ec2/)
[![](https://img.shields.io/badge/Amazon_RDS-232F3E?style=flat&logo=amazon-rds&logoColor=white)](https://aws.amazon.com/rds/)
[![](https://img.shields.io/badge/Nginx-009639?style=flat&logo=nginx&logoColor=white)](https://nginx.org/)
[![](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)](https://www.mysql.com/)

## 使用素材
> Canva：https://www.canva.com/<br>
> Unsplash：https://unsplash.com/ja
