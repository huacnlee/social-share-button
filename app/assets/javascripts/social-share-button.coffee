window.SocialShareButton =
  services: -> 
    services =
      facebook: [600, 500]
      twitter: [500, 270]
      weibo: [550, 360]
      pinterest: [750, 330]
      tumblr: [450, 360]
      delicious: [700, 500]
      google_plus: [500, 340]
      google_bookmark: [630, 470]
      douban: [630, 270]
      qq: [630, 270]
      tqq: [630, 270]
      baidu: [630, 270]
      kaixin001: [630, 270]
      renren: [630, 270]
      plurk: [630, 270]
      

  openUrl: (url, service) ->
    this.openPopup(url, { width: @services()[service][0], height: @services()[service][1] })
    false
    
  openPopup: (url, params) ->
      left = Math.round(screen.width / 2 - params.width / 2)
      top = 0
      if (screen.height > params.height)
        top = Math.round(screen.height / 3 - params.height / 2)
      
      win = window.open(url, 'sl_' + this.service, 'left=' + left + ',top=' + top + ',' +
         'width=' + params.width + ',height=' + params.height + ',personalbar=0,toolbar=0,scrollbars=1,resizable=1')
      if win
        win.focus()
        this.widget.trigger('popup_opened.' + prefix, [this.service, win])
        timer = setInterval($.proxy( ->
          return if (!win.closed)
          clearInterval timer
          this.widget.trigger('popup_closed.' + prefix, this.service)
        , this), this.options.popupCheckInterval)
      else 
        location.href = url
     

  share: (el) ->
    site = $(el).data('site')
    title = encodeURIComponent($(el).parent().data('title') || '')
    img = encodeURIComponent($(el).parent().data("img") || $(el).data('img') || '')
    url = encodeURIComponent($(el).parent().data("url") || '')
    if url.length == 0
      url = encodeURIComponent(location.href)
    switch site
      when "email"
        location.href = "mailto:?to=&subject=#{title}&body=#{url}"
      when "weibo"
        SocialShareButton.openUrl("http://service.weibo.com/share/share.php?url=#{url}&type=3&pic=#{img}&title=#{title}", site)
      when "twitter"
        SocialShareButton.openUrl("https://twitter.com/home?status=#{title}: #{url}", site)
      when "douban"
        SocialShareButton.openUrl("http://shuo.douban.com/!service/share?href=#{url}&name=#{title}&image=#{img}", site)
      when "facebook"
        SocialShareButton.openUrl("https://www.facebook.com/sharer.php?u=#{url}", site)
      when "qq"
        SocialShareButton.openUrl("http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=#{url}&title=#{title}&pics=#{img}", site)
      when "tqq"
        SocialShareButton.openUrl("http://share.v.t.qq.com/index.php?c=share&a=index&url=#{url}&title=#{title}&pic=#{img}", site)
      when "baidu"
        SocialShareButton.openUrl("http://hi.baidu.com/pub/show/share?url=#{url}&title=#{title}&content=", site)
      when "kaixin001"
        SocialShareButton.openUrl("http://www.kaixin001.com/rest/records.php?url=#{url}&content=#{title}&style=11&pic=#{img}", site)
      when "renren"
        SocialShareButton.openUrl("http://widget.renren.com/dialog/share?resourceUrl=#{url}&srcUrl=#{url}&title=#{title}&pic=#{img}&description=", site)
      when "google_plus"
        SocialShareButton.openUrl("https://plus.google.com/share?url=#{url}", site)
      when "google_bookmark"
        SocialShareButton.openUrl("https://www.google.com/bookmarks/mark?op=edit&output=popup&bkmk=#{url}&title=#{title}", site)
      when "delicious"
        SocialShareButton.openUrl("http://www.delicious.com/save?url=#{url}&title=#{title}&jump=yes&pic=#{img}", site)
      when "plurk"
        SocialShareButton.openUrl("http://www.plurk.com/?status=#{title}: #{url}&qualifier=shares", site)
      when "pinterest"
        SocialShareButton.openUrl("http://www.pinterest.com/pin/create/button/?url=#{url}&media=#{img}&description=#{title}", site)
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

        SocialShareButton.openUrl("http://www.tumblr.com/share#{tumblr_params()}", site)
    false
