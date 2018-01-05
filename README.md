# Social Share Button

This is a gem to helper you quick create a share feature in you Rails apps.

[![Gem Version](https://badge.fury.io/rb/social-share-button.svg)](https://badge.fury.io/rb/social-share-button)

# Sites list

* Facebook
* Twitter
* Douban
* Google+
* Weibo
* QZone
* Google Bookmark
* Delicious
* Tumblr
* Pinterest
* Email
* LinkedIn
* WeChat (Weixin)
* Vkontakte
* Odnoklassniki
* Xing
* Reddit
* Hacker News
* Telegram

## Screenshot

<img width="473" alt="2016-10-05 8 51 07" src="https://cloud.githubusercontent.com/assets/5518/19097657/ea7c0a20-8ad8-11e6-953f-83354d9a6384.png">

## Install

In your `Gemfile`:

```ruby
gem 'social-share-button'
```

Old version for IE and lower browser support:

```ruby
gem 'social-share-button', '0.2.1'
```

And install it:

```bash
$ bundle install
$ rails generate social_share_button:install
```

## Configure

You can config `config/initializers/social_share_button.rb` to choose which site do you want to use:

```ruby
SocialShareButton.configure do |config|
  config.allow_sites = %w(mail linked twitter facebook google)
end
```

## Usage

You need add require css,js file in your app assets files:

`app/assets/javascripts/application.coffee`

```
#= require social-share-button
#= require social-share-button/wechat # if you need use WeChat
```

`app/assets/stylesheets/application.scss`

```
*= require social-share-button
```

In Rails 4.1.6 , use `@import` to require files:

`app/assets/stylesheets/application.css.scss`

```
@import "social-share-button";
```

Then you can use `social_share_button_tag` helper in views, for example `app/views/posts/show.html.erb`

```erb
<%= social_share_button_tag(@post.title) %>
```

Apart from the default title, you can specify the title for the special social network:

```erb
<%= social_share_button_tag(@post.title, 'data-twitter-title' => 'TheTitleForTwitter') %>
```

To specify sites at runtime:

```erb
<%= social_share_button_tag(@post.title, :allow_sites => %w(twitter facebook)) %>
```

And you can custom rel attribute:

```erb
<%= social_share_button_tag(@post.title, :rel => "twipsy") %>
```

You can also specify the URL that it links to:

```erb
<%= social_share_button_tag(@post.title, :url => "http://myapp.com/foo/bar") %>
```

```erb
<%= social_share_button_tag(@post.title, :url => "http://myapp.com/foo/bar", :image => "http://foo.bar/images/a.jpg", desc: "The summary of page", via: "MyTwitterName") %>
```

For the Tumblr there are an extra settings, prefixed with : `data-*`

```erb
<%= social_share_button_tag(@post.title, :image => "https://raw.github.com/vkulpa/social-share-button/master/lib/assets/images/sprites/social-share-button/tumblr.png", :'data-type' => 'photo') %>
<%= social_share_button_tag(@post.title, :'data-source' => "https://raw.github.com/vkulpa/social-share-button/master/lib/assets/images/sprites/social-share-button/tumblr.png", :'data-type' => 'photo') %>
```

Those two above calls are identical.
Here are the mapping of attributes depending on you data-type parameter

| data-type         | standard  | custom :"data-*" prefixed  |
| ----------------- | --------- | -------------------------- |
| link (default)    | title     | data-title                 |
|                   | url       | data-url                   |
| text              | title     | data-title                 |
| photo             | title     | data-caption               |
|                   | image     | data-source                |
| quote             | title     | data-quote                 |
|                   |           | data-source                |

## More arguments
#options:

all of the following can be passes as named parameters (options) to the second argument of `social_share_button_tag`

rel
  *TODO: document*

url
  *TODO: document*

desc
  *TODO: document*

child_content
  WARNING: will be output as raw html; HTML standards recommend you input inline-level elements only

allow_sites
  override default settings set in base calss

inner_element 
  defaults to nothing, but can be overridden for other elements. 
  pass as **element name only without <...> syntax marks**
  note *each* a tag (href) displayed will wrap a copy of this content, if passed
  use when you need an additional element as your button, like a font awesome
  <i class='fa-icon'></i>, etc. 
  leave as nothing to style fully using the native a href
  
self_styled
  defaults to false; use social share styling for the social icons themselves
  set to true to use your own social icons
  
 
self_general_styled
  defautls to false; use social share general styling
  set to true to turn off social share's general styling completely 

classes 
  classes applied to inner_element 


## How to change icon size?

Yes, you can override social-share-button base css to change the icon size.

In you `app/assets/stylesheets/application.scss`:

```scss
$size: 24px;

.social-share-button {
  .ssb-icon {
    background-size: $size $size;
    height: $size;
    width: $size;
  }
}
```

Alternatively, pass self_styled to true turn off all social sharing icons and self_general_styled true to off all general styles applied by the gem. 

## Demo

[https://ruby-china.org/wiki/about](https://ruby-china.org/wiki/about)
