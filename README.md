# Social Share Button

This is a gem to helper you quick create a share feature in you Rails apps.

# Sites list

* Facebook
* Twitter
* Douban
* Google+
* Weibo
* QZone
* Tencent Weibo
* Renren
* Hi Baidu
* Kaixin001
* Google Bookmark

## Screenshot

![img](http://l.ruby-china.org/photo/3c9633ac35c56be800ef9592ad594c4b.png)

## Install

In your `Gemfile`:

```ruby
gem 'social-share-button'
```

And install it:

```bash
$ bundle install
$ rails generate social_share_button:install
```

## Configure

You can config `config/initializes/social_share_button.rb` to choose which site do you want to use:

```ruby
SocialShareButton.configure do |config|
  config.allow_sites = %w(twitter facebook google_plus weibo douban tqq renren qq kaixin001 baidu)
end
```

## Usage

You need add require css,js file in your app assets files:

`app/assets/javascripts/application.coffee`

```
#= require social-share-button
```

`app/assets/stylesheets/application.scss`

```
*= require social-share-button
```

Then you can use `social_share_button_tag` helper in views, for example `app/views/posts/show.html.erb`

```erb
<%= social_share_button_tag(@post.title) %>
```

And you can custom rel attribute:

```erb
<%= social_share_button_tag(@post.title, :rel => "twipsy") %>
```

You can also specify the URL that it links to:

```erb
<%= social_share_button_tag(@post.title, :url => "http://myapp.com/foo/bar") %>
```

## Demo

[http://ruby-china.org/wiki/about](http://ruby-china.org/wiki/about)
