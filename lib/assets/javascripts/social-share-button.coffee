window.SocialShareButton =
  openUrl : (url) ->
    window.open(url)
    false

  share : (el) ->
    site = $(el).data('site')
    title = encodeURIComponent($(el).parent().data('title'))
    img = encodeURIComponent($(el).parent().data("img"))
    url = encodeURIComponent(location.href)
    switch site
      when "weibo"
        SocialShareButton.openUrl("http://v.t.sina.com.cn/share/share.php?url=#{url}&pic=#{img}&title=#{title}&content=utf-8")
      when "twitter"
        SocialShareButton.openUrl("https://twitter.com/home?status=#{title}: #{url}")
      when "douban"
        SocialShareButton.openUrl("http://www.douban.com/recommend/?url=#{url}&title=#{title}&image=#{img}")
      when "facebook"
        SocialShareButton.openUrl("http://www.facebook.com/sharer.php?t=#{title}&u=#{url}")
      when "qq"
        SocialShareButton.openUrl("http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=#{url}&title=#{title}&pics=#{img}")
      when "tqq"
        SocialShareButton.openUrl("http://share.v.t.qq.com/index.php?c=share&a=index&url=#{url}&title=#{title}&pic=#{img}")
      when "baidu"
        SocialShareButton.openUrl("http://apps.hi.baidu.com/share/?url=#{url}&title=#{title}&content=")
      when "kaixin001"
        SocialShareButton.openUrl("http://www.kaixin001.com/rest/records.php?url=#{url}&content=#{title}&style=11&pic=#{img}")
      when "renren"
        SocialShareButton.openUrl("http://widget.renren.com/dialog/share?resourceUrl=#{url}&title=#{title}&description=")
      when "google_plus"
        SocialShareButton.openUrl("https://plus.google.com/share?url=#{url}&t=#{title}")
      when "google_bookmark"
        SocialShareButton.openUrl("https://www.google.com/bookmarks/mark?op=edit&output=popup&bkmk=#{url}&title=#{title}")
    false