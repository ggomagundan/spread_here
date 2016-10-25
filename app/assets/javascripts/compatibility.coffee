ready = ->
  loadFacebookSDK()
#  bindFacebookEvents() unless window.fbEventsBound
  bindFacebookEvents()

bindFacebookEvents = ->
  $(document)
    .on('page:fetch', saveFacebookRoot)
    .on('page:change', restoreFacebookRoot)
    .on('page:load', ->
      FB?.XFBML.parse()
    )
  @fbEventsBound = true

saveFacebookRoot = ->
  if $('#fb-root').length
    @fbRoot = $('#fb-root').detach()

restoreFacebookRoot = ->
  if @fbRoot?
    if $('#fb-root').length
      $('#fb-root').replaceWith @fbRoot
    else
      $('body').append @fbRoot

loadFacebookSDK = ->
  window.fbAsyncInit = initializeFacebookSDK
  $.getScript("//connect.facebook.net/ko_KR/sdk.js")

initializeFacebookSDK = ->
  FB.init
    appId  : '1705707066372193'
    status : true
    cookie : true
    xfbml  : true
    version: 'v2.8'

$(document).ready(ready)
$(document).on('turbolinks:load', ready)
