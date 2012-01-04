window.SocialShareButton =
  openUrl : (url) ->
    window.open(url)
    false
    
  share : (site, title) ->
    url = encodeURIComponent(location.href)
    title = encodeURIComponent(title)
    switch site
      when "weibo"
        SocialShareButton.openUrl("http://v.t.sina.com.cn/share/share.php?url=#{url}&title=#{title}&content=utf-8")
      when "twitter"
        SocialShareButton.openUrl("https://twitter.com/home?status=#{title}: #{url}")
      when "douban"
        SocialShareButton.openUrl("http://www.douban.com/recommend/?url=#{url}&title=#{title}&v=1&r=1")
      when "facebook"
        SocialShareButton.openUrl("http://www.facebook.com/sharer.php?t=#{title}&u=#{url}")
      when "qq"
        SocialShareButton.openUrl("http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=#{url}")
    false