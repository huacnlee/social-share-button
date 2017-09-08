window.SocialShareButton =
  openUrl : (url, width = 640, height = 480) ->
    left = (screen.width / 2) - (width / 2)
    top = (screen.height * 0.3) - (height / 2)
    opt = "width=#{width},height=#{height},left=#{left},top=#{top},menubar=no,status=no,location=no"
    window.open(url, 'popup', opt)
    false

  share : (el) ->
    site = $(el).data('site')
    appkey = $(el).data('appkey') || ''
    $parent = $(el).parent()
    title = encodeURIComponent($(el).data(site + '-title') || $parent.data('title') || '')
    img = encodeURIComponent($parent.data("img") || '')
    url = encodeURIComponent($parent.data("url") || '')
    via = encodeURIComponent($parent.data("via") || '')
    desc = encodeURIComponent($parent.data("desc") || ' ')

    # tracking click events if google analytics enabled
    ga = window[window['GoogleAnalyticsObject'] || 'ga']
    if typeof ga == 'function'
      ga('send', 'event', 'Social Share Button', 'click', site)

    if url.length == 0
      url = encodeURIComponent(location.href)
    switch site
      when "email"
        location.href = "mailto:?to=&subject=#{title}&body=#{url}"
      when "weibo"
        SocialShareButton.openUrl("http://service.weibo.com/share/share.php?url=#{url}&type=3&pic=#{img}&title=#{title}&appkey=#{appkey}", 620, 370)
      when "twitter"
        hashtags = encodeURIComponent($(el).data(site + '-hashtags') || $parent.data('hashtags') || '')
        via_str = ''
        via_str = "&via=#{via}" if via.length > 0
        SocialShareButton.openUrl("https://twitter.com/intent/tweet?url=#{url}&text=#{title}&hashtags=#{hashtags}#{via_str}", 650, 300)
      when "douban"
        SocialShareButton.openUrl("http://shuo.douban.com/!service/share?href=#{url}&name=#{title}&image=#{img}&sel=#{desc}", 770, 470)
      when "facebook"
        SocialShareButton.openUrl("http://www.facebook.com/sharer/sharer.php?u=#{url}&display=popup&quote=#{desc}", 555, 400)
      when "qq"
        SocialShareButton.openUrl("http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=#{url}&title=#{title}&pics=#{img}&summary=#{desc}&site=#{appkey}")
      when "google_plus"
        SocialShareButton.openUrl("https://plus.google.com/share?url=#{url}")
      when "google_bookmark"
        SocialShareButton.openUrl("https://www.google.com/bookmarks/mark?op=edit&output=popup&bkmk=#{url}&title=#{title}")
      when "delicious"
        SocialShareButton.openUrl("https://del.icio.us/save?url=#{url}&title=#{title}&jump=yes&pic=#{img}")
      when "pinterest"
        SocialShareButton.openUrl("http://www.pinterest.com/pin/create/button/?url=#{url}&media=#{img}&description=#{title}")
      when "linkedin"
        SocialShareButton.openUrl("https://www.linkedin.com/shareArticle?mini=true&url=#{url}&title=#{title}&summary=#{desc}")
      when "xing"
        SocialShareButton.openUrl("https://www.xing.com/spi/shares/new?url=#{url}")
      when "vkontakte"
        SocialShareButton.openUrl("http://vk.com/share.php?url=#{url}&title=#{title}&image=#{img}")
      when "odnoklassniki"
        SocialShareButton.openUrl("https://connect.ok.ru/offer?url=#{url}&title=#{title}&description=#{desc}&imageUrl=#{img}")
      when "wechat"
        throw new Error("You should require social-share-button/wechat to your application.js") unless window.SocialShareWeChatButton
        window.SocialShareWeChatButton.qrcode
          url: decodeURIComponent(url)
          header: $(el).attr('title')
          footer: $(el).data('wechat-footer')

      when "tumblr"
        get_tumblr_extra = (param) ->
          cutom_data = $(el).attr("data-#{param}")
          encodeURIComponent(cutom_data) if cutom_data

        tumblr_params = ->
          path = get_tumblr_extra('type') || 'link'

          params = switch path
            when 'text'
              title = get_tumblr_extra('title') || title
              "title=#{title}"
            when 'photo'
              title = get_tumblr_extra('caption') || title
              source = get_tumblr_extra('source') || img
              "caption=#{title}&source=#{source}"
            when 'quote'
              quote = get_tumblr_extra('quote') || title
              source = get_tumblr_extra('source') || ''
              "quote=#{quote}&source=#{source}"
            else # actually, it's a link clause
              title = get_tumblr_extra('title') || title
              url = get_tumblr_extra('url') || url
              "name=#{title}&url=#{url}"


          "/#{path}?#{params}"

        SocialShareButton.openUrl("http://www.tumblr.com/share#{tumblr_params()}")

      when "reddit"
        SocialShareButton.openUrl("http://www.reddit.com/submit?url=#{url}&newwindow=1", 555, 400)
      when "hacker_news"
        SocialShareButton.openUrl("http://news.ycombinator.com/submitlink?u=#{url}&t=#{title}", 770, 500)
      when "telegram"
        SocialShareButton.openUrl("https://telegram.me/share/url?text=#{title}&url=#{url}")
    false
