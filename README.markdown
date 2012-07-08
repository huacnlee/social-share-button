# Social Share Button

This is a gem to helper you quick create a share feature in you Rails apps.

## Screenshot

![img](http://l.ruby-china.org/photo/00cc56853b29b5d90458d39e855a936d.png)

## Install

in your `Gemfile`:

    gem 'social-share-button', '~> 0.0.4'
    
an install it:

    $ bundle install
    $ rails generate social_share_button:install
    
## Configure

you can create this content in `config/initializes/social_share_button.rb`:

    SocialShareButton.configure do |config|
      config.allow_sites = %w(twitter facebook weibo douban)
    end
    
## Usage

you need add require css,js file in your app assets files:

`app/assets/javascripts/application.js`

    //= require social-share-button
    
`app/assets/stylesheets/application.css`

    *= require social-share-button
    
then you can use `social_share_button_tag` helper in views, for example `app/views/posts/show.html.erb`

    <%= social_share_button_tag(@post.title) %>

and you can custom rel attribute:

    <%= social_share_button_tag(@post.title, :rel => "twipsy") %>
    
## Demo

[http://ruby-china.org/wiki/about](http://ruby-china.org/wiki/about)
