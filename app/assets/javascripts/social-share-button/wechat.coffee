#= require jquery.qrcode.min

window.SocialShareWeChatButton =
  init: (opts={}) ->
    $wDialog = "<div id='ss-wechat-dialog' class='ss-wechat-dialog'>
                  <div class='wechat-popup-header'>
                    <span>#{opts.header}</span>
                    <a href='#' onclick='return false;' class='wechat-popup-close'>×</a>
                  </div>
                  <div id='ss-wechat-dialog-qr' class='wechat-dialog-qr'></div>
                  <div class='wechat-popup-footer'>
                    #{opts.footer}
                  </div>
               </div>"

    $("body").append($wDialog)

   bindEvents: ()->
     $wContainer = $("#ss-wechat-dialog")
     $wContainer.find(".wechat-popup-close").on "click", (e) ->
       $wContainer.hide()

   qrcode: (opts={}) ->
     unless $("#ss-wechat-dialog").length
       @init(opts)
       @bindEvents()

     $wBody = $('#ss-wechat-dialog-qr')
     $wBody.empty()
     $wBody.qrcode
       width: 200
       height: 200
       text: opts.url

     $wContainer = $("#ss-wechat-dialog")
     top = ($(window).height() - $wContainer.height()) / 2
     top = 100 if top < 100
     left = ($(window).width() - $wContainer.width()) / 2

     $wContainer.css
       top: top
       left: left

     $wContainer.show()
