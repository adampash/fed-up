$(document).ready ->
  resize = (first=false, complete)->
    return unless window.scrollY is 0 or first is true
    newHeight = $(window).height() - $('.navbar').height()
    $('#hero').height(newHeight)
    $('.hero-logo').css('margin-top', Math.floor(newHeight/2) - 300)
    complete() if complete?

  $(window).on 'resize', resize
  resize true, ->
    if !(/Android|iPhone|iPad|iPod|BlackBerry|Windows Phone/i).test(navigator.userAgent)
      skrollr.init
        forceHeight: false
        render: (data) ->


