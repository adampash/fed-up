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


$( ->
  $('a[href*=#]:not([href=#])').click ->
    if (location.pathname.replace(/^\//,'') == @pathname.replace(/^\//,'') && location.hostname == @hostname)
      target = $(@hash)
      target = if target.length then target else $("[name=#{@hash.slice(1)}]")
      if target.length
        $('html,body').animate(
          scrollTop: target.offset().top
          , 1000)
        return false
)
