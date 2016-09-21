#= require jquery.qrcode.min

window.SocialShareWeichatButton =
  init: (opts={}) ->
    $wDialog = "<div id='ss-weichat-dialog' class='ss-weichat-dialog'>
                  <div class='weichat-popup-header'>
                    <span>#{opts.header}</span>
                    <a href='#' onclick='return false;' class='weichat-popup-close'>×</a>
                  </div>
                  <div id='ss-weichat-dialog-qr' class='weichat-dialog-qr'></div>
                  <div class='weichat-popup-footer'>
                    #{opts.footer}
                  </div>
               </div>"

    $("body").append($wDialog)

   bindEvents: ()->
     $wContainer = $("#ss-weichat-dialog")
     $wContainer.find(".weichat-popup-close").on "click", (e) ->
       $wContainer.hide()

   qrcode: (opts={}) ->
     unless $("#ss-weichat-dialog").length
       @init(opts)
       @bindEvents()

     $wBody = $('#ss-weichat-dialog-qr')
     $wBody.empty()
     $wBody.qrcode
       width: 200
       height: 200
       text: location.href

     $wContainer = $("#ss-weichat-dialog")
     top = ($(window).height() - $wContainer.height()) / 2
     top = 100 if top < 100
     left = ($(window).width() - $wContainer.width()) / 2

     $wContainer.css
       top: top
       left: left

     $wContainer.show()
