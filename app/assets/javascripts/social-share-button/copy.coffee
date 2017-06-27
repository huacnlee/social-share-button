#= require clipboard

$(document).ready ->
  clipboard = new Clipboard('.ssb-copy')
  clipboard.on 'success', ->
    msg = document.querySelectorAll('.social-share-button .copy-success')[0]
    msg.classList.add('visible')
    setTimeout ->
      msg.classList.remove('visible')
    , 3000
      
  clipboard.on 'error', ->
    console.log "Clipboard error"
