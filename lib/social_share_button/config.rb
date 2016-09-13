module SocialShareButton
  class << self
    attr_accessor :config
    def configure
      yield self.config ||= Config.new
    end
  end

  class Config
    # enable social sites to share,
    # * site support:
    # - twitter
    # - facebook
    # - google_plus
    # - weibo
    # - qq
    # - douban
    # - google_bookmark
    # - delicious
    # - tumblr
    # - pinterest
    # - email
    # - linkedin
    # - weichat
    # - vkontakte
    # - whatsapp
    attr_accessor :allow_sites

    def initialize
    end
  end
end
