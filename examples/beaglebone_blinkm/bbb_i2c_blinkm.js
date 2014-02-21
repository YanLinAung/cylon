var Cylon = require('../..');

Cylon.robot({
  connection: {
    name: 'beaglebone',
    adaptor: 'beaglebone'
  },
  device: {
    name: 'pixel',
    driver: 'blinkm',
    pin: 'P9_20'
  },
  work: function(my) {
    var color;
    my.pixel.stopScript();
    my.pixel.goToRGB(255, 0, 0);
    my.pixel.fadeToRGB(0, 255, 0);
    my.pixel.fadeToHSB(100, 180, 90);
    my.pixel.fadeToRandomRGB(0, 0, 255);
    my.pixel.fadeToRandomHSB(100, 180, 90);
    my.pixel.playLightScript(1, 0, 0);
    my.pixel.stopScript();
    my.pixel.setFadeSpeed(50);
    my.pixel.setTimeAdjust(50);
    color = my.pixel.getRGBColor();
    if (typeof err === "undefined" || err === null) {
      console.log(color);
    }
    return my.pixel.getRGBColor(function(err, data) {
      if (err == null) {
        return console.log(data);
      }
    });
  }
}).start();