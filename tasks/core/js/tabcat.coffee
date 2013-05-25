tabcat = {}

# MATH

tabcat.math = {}

# return a number chosen uniformly at random from [a, b)
tabcat.math.randomUniform = (a, b) -> a + Math.random() * (b - a)

# randomly return true or false
tabcat.math.coinFlip = -> Math.random() < 0.5

# return x, clamped to between min and max
tabcat.math.clamp = (min, x, max) -> Math.min(max, Math.max(min, x))



# UI

tabcat.ui = {}

# Register a click immediately on tap/mouseup, rather than waiting for
# a double-click (requires fastclick.js)
tabcat.ui.enableFastClick = ->
  $(-> FastClick.attach(document.body))


tabcat.ui.fixAspectRatio = (element, ratio) ->
  # Ensure that *element* has the given aspect ratio (width / height),
  # and make it as large as possible within the bounds of its parent
  # element. This property will be preserved on window resize.
  #
  # We do this by setting its left, right, width, etc.
  # to the appropriate percentage. We do not set border, margin, or padding.

  # TODO: handle nested elements properly (currently we'll get wrong results
  # if you call this on an element and then on its parent)

  # TODO: set max height in inches so that tests will display at the same size
  # on different devices, assuming screen is large enough. Use
  # https://github.com/tombigel/detect-zoom or something similar to determine
  # real pixel size (devices generally use a fake dpi by convention).
  element = $(element)

  fixElement = (event) ->
    parent = $(element.parent())
    parentWidth = parent.width()
    parentHeight = parent.height()
    parentRatio = parentWidth / parentHeight

    if parentRatio > ratio
      # parent is too wide, need gap on left and right
      gap = 100 * (parentRatio - ratio) / parentRatio / 2

      element.css({
        position: 'absolute'
        left: gap + '%'
        right: 100 - gap + '%'
        width: 100 - 2 * gap + '%'
        top: '0%'
        bottom: '100%'
        height: '100%'
      })
    else
      # parent is too narrow, need gap on top and bottom
      gap = (100 * (1 / parentRatio - 1 / ratio) * parentRatio / 2)

      element.css({
        position: 'absolute'
        left: '0%'
        right: '100%'
        width: '100%'
        top: gap + '%'
        bottom: 100 - gap + '%'
        height: 100 - 2 * gap + '%'
      })

  fixElement(element)

  $(window).resize(fixElement)


# make sure the font-size of the given element is always the given percent
# of the element's height. This will be preserved on window resize.
tabcat.ui.linkFontSizeToHeight = (element, percent) ->
  element = $(element)

  fixElement = (event) ->
    # for font-size, "%" means % of default font size, not % of height.
    sizeInPx = element.height() * percent / 100
    element.css({'font-size': sizeInPx + 'px'})

  fixElement(element)

  $(window).resize(fixElement)


# Don't allow the document to scroll past its boundaries. This only works
# if your document isn't larger than the viewport.
#
# You'll probably want to disable zooming as well, which is done with a
# meta tag:
#
# <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0,
# maximum-scale=1.0, user-scalable=no">
tabcat.ui.turnOffBounce = ->
  $(document).bind('touchmove', (event) ->
    event.preventDefault())



this.tabcat = tabcat