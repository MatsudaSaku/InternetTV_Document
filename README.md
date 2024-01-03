# InternetTV_Document
今回はインターネットTVで使用するデータベースを構築しようと思います。  

条件は以下の通りです。
## インターネットTV(要件定義)
> 好きな時間に好きな場所で話題の動画を無料で楽しめる「インターネットTVサービス」を新規に作成することになりました。  
>データベース設計をした上で、データ取得する SQL を作成してください。
>
>仕様は次の通りです。サービスのイメージとしては ABEMA を頭に思い浮かべてください。
>
> ドラマ1、ドラマ2、アニメ1、アニメ2、スポーツ、ペットなど、複数のチャンネルがある  
> 各チャンネルの下では時間帯ごとに番組枠が1つ設定されており、番組が放映される  
> 番組はシリーズになっているものと単発ものがある。シリーズになっているものはシーズンが1つものと、  
> シーズン1、シーズン2のように複数シーズンのものがある。  
> 各シーズンの下では各エピソードが設定されている。  
> 再放送もあるため、ある番組が複数チャンネルの異なる番組枠で放映されることはある  
> 番組の情報として、タイトル、番組詳細、ジャンルが画面上に表示される  
> 各エピソードの情報として、シーズン数、エピソード数、タイトル、エピソード詳細、動画時間、公開日、視聴数が画面上に表示される。  
> 単発のエピソードの場合はシーズン数、エピソード数は表示されない  
> ジャンルとしてアニメ、映画、ドラマ、ニュースなどがある。各番組は1つ以上のジャンルに属する  
> KPIとして、チャンネルの番組枠のエピソードごとに視聴数を記録する。なお、一つのエピソードは複数の異なるチャンネル及び番組枠で放送されることがあるので、属するチャンネルの番組枠ごとに視聴数がどうだったかも追えるようにする
> 
> **番組、シーズン、エピソードの関係について、以下のようなイメージです(シリーズになっているものの例)。**  
> 
>番組：鬼滅の刃  
>シーズン：1  
>エピソード：1話、2話、...、26話  

## テーブル設計
<details>
 
<summary>ER図</summary>


![plantuml](https://github.com/MatsudaSaku/InternetTV_Document/assets/149235059/49806853-e3d2-474a-b662-f39c338cf6ce)

</details>

## データベースの構築
今回はMySQLを利用して作成していきます。  
まずはMySQLのユーザーを選択してから、データベース'InternetTV'を作成します。  
クエリは以下の通りです。  
```mysql
 CREATE DATABASE internettv;
```
早速確認してみましょう。

```mysql
 SHOW DATABASES;
```

上記のクエリを実行し、
internettv　が表示されればOKです。

次は以下のクエリを実行し、使用するデータベースを選びます。

```mysql
 USE internettv;
```
使用するデータベースを問題なく指定できれば、データベースの構築は終了です。  
次は作成したデータベース内にテーブルを作成していきましょう。

## テーブル作成
テーブル設計は上記のER図の通りです。  
ER図の四角い一覧一つ一つがエンティティ(テーブル)です。  

テーブル作成のための具体的なクエリは以下のファイル内に記載しておきます。

[SQLテーブル作成クエリ](/Create_Table.sql)

## データ抽出クエリ
作成したテーブルから実際にデータを抽出してみましょう。  









