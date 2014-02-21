# Beaglebone BlinkM

First, let's import Cylon:

    Cylon = require('../..')

Now that we have Cylon imported, we can start defining our robot

    Cylon.robot

Let's define the connections and devices:

      connection:
        name: 'beaglebone', adaptor: 'beaglebone'

      device:
        name: 'pixel', driver: 'blinkm', pin: 'P9_20'

Now that Cylon knows about the necessary hardware we're going to be using, we'll
tell it what work we want to do:

      work: (my) ->
        # we do our thing here
        my.pixel.stopScript()
        # You can pass a callback to all blinkm functions as the last param,
        # If you do the command would be executed asynchronously.
        # For write operations you get an (err) param passed back,
        # null/undefined for success, and containing the error y any encountered.
        #
        # Write BlimkM commands.
        my.pixel.goToRGB(255, 0, 0)
        my.pixel.fadeToRGB(0, 255, 0)
        my.pixel.fadeToHSB(100, 180, 90)
        my.pixel.fadeToRandomRGB(0, 0, 255)
        my.pixel.fadeToRandomHSB(100, 180, 90)
        my.pixel.playLightScript(1, 0, 0)
        my.pixel.stopScript()
        my.pixel.setFadeSpeed(50)
        my.pixel.setTimeAdjust(50)
        # For read commands you get (err, data) passed back to the callback,
        # data contains the read data buffer, in case of Sync call (no callback)
        # you get a regular return.
        color = my.pixel.getRGBColor()
        console.log(color) unless err?
        # Example getting the color usinc async call and a callback
        my.pixel.getRGBColor((err, data) ->
          console.log(data) unless err?
        )

Now that our robot knows what work to do, and the work it will be doing that
hardware with, we can start it:

    .start()
