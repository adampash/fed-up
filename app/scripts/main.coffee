isMobile = (/Android|iPhone|iPad|iPod|BlackBerry|Windows Phone/i).test(navigator.userAgent)

resize = (first=false, complete)=>
  return unless window.scrollY is 0 or first is true
  newHeight = $(window).height() - $('.navbar').height()
  if isMobile
    $('#hero').height(newHeight)
    # $('.hero-logo').css('margin-top', Math.max(Math.floor(newHeight/2) - 320), 100)
  else
    minHeight = 640
    $('#hero').height(Math.max(newHeight, minHeight))
    $('.hero-logo').css('margin-top', Math.max(Math.floor(newHeight/2) - 320), 40)
  complete() if complete?

$(document).ready ->
  $(window).on 'resize', resize
  resize true

$('.full-bleed').on 'load', ->
  if !isMobile
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
