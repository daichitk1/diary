<h1>自己管理ツール</h1>
<div>
  日記、タスク管理、カレンダーなど統合的な機能を含んだ自己管理ツールを作成する。<br>
  実用的なツールの作成を目指す。<br>
</div>
<div>
  <h2>利用する言語</h2>
  現在は、バックエンドはRuby、フロントエンドはHTML/CSS、フレームワークはRuby on railsを利用している。<br>
  今後、より作るものの幅を広げるため、JavaScript (Jquery)とReactを学習し機能を拡張する。
</div>

<div>
  <h2>開発の方針</h2>
  必要な機能が生じた時の新しく付け加える形で作成する。また、現段階ではとりあえず形にするところを重視し、余裕ができてからコードのリファクタリングを行う。
</div>

<div>
  <h2>利用方法</h2>
  <h3>1. git cloneを行い、ローカルの環境にコードを持ってくる</h3>
  <h3>2.rubyの環境構築を行なう</h3>
  以下の三つをコマンドで実行することで環境構築が可能です。<br>
  rbenv install 3.3.5<br>
  gem install bundler<br>
  bundle install -gemfile "gemfileのパス"<br><br>

  以上で環境構築は終わりです。<br><br>
  
  <h3>3. railsコンソールでユーザーを作成する</h3>
  以下のサイトを参考にパスワードの実装をしました。<br>
  https://qiita.com/ryosuketter/items/805452b7e6bf9637cb57<br><br>

そのため、railsコンソールをrails consoleで開いた後、以下のコマンドを入力し実行してください。<br>
user = User.new(email: メールアドレス, password: 任意のパスワード)<br>
user.save<br><br>

<h3>4. rails sで起動する。</h3>
ターミナルにアクセスすべきURLが出るのでこのURLを入力してください。<br>
おそらく、http://127.0.0:3000<br><br>

<h3>5. ログイン画面でメールアドレスとパスワードを入力</h3>
rails sでruby on railsを起動すると、ログイン画面に遷移できるので先ほど登録したメールアドレスとパスワードを入力してください。<br><br>

</div>
<b>注意事項</b>ローカル環境でユーザー1人が利用する前提で作成しています(セキュリティなど不備があることが考えられるため)
