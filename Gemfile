source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'mysql2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
#gem 'mini_racer', platforms: :ruby
gem 'turbolinks', '~> 5'
#JsonをDSLで表記できる。
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 4.0'
#bootstrapのsass版
#gem 'bootstrap-sass'
#認証機能が実装できる。
gem 'devise'
#画像のアップロード機能ができる。
gem 'carrierwave', '~> 1.0'
#spotify apiをrailsで使いやすくしてくれる
gem 'rspotify'
#環境変数が管理できる
gem 'dotenv-rails'
#ユーザーの権限管理ができる
gem 'cancancan'
#アドミンのデータ管理がGUIでできる
gem 'rails_admin'
#検索機能が実装できるgem
gem 'ransack'

gem 'font-awesome-rails'

gem 'jquery-rails'

group :development, :test do

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  #https://github.com/rails/rails-controller-testing
  gem 'rails-controller-testing'
  #メールの送信が正常に行われているか開発環境で確認できるgem
  gem 'letter_opener'
  gem 'letter_opener_web'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
