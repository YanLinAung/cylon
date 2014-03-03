# Skynet Blink
    
First, let's import Cylon:

    Cylon = require '../..'

Now that we have Cylon imported, we can start defining our robot

    Cylon.robot

Let's define the connections and devices:

      connections: [
        { name: 'arduino', adaptor: 'firmata', port: '/dev/ttyACM0' },
    #    { name: 'skynet', adaptor: 'skynet', uuid: "742401f1-87a4-11e3-834d-670dadc0ddbf", token: "xjq9h3yzhemf5hfrme8y08fh0sm50zfr" }
        { name: 'skynet', adaptor: 'skynet', host: 'localhost', portNumber: 3000, uuid: "18676eb1-9997-11e3-8c2a-f18a07a72684", token: "vbeo289aik65hfr1lns8vst273nmi" }
      ]

      device: { name: 'led', driver: 'led', pin: 13, connection: 'arduino' }

Now that Cylon knows about the necessary hardware we're going to be using, we'll
tell it what work we want to do:

      work: (my) ->
        Logger.info "connected..."
        my.connections['skynet'].on 'message', (data) ->
          console.log(data)
          data = JSON.parse(data)
          if data.message.red is 'on'
            console.log("red on request received from skynet");
            my.led.turnOn()
          else if data.message.red is 'off'
            console.log("red off request received from skynet");
            my.led.turnOff()

Now that our robot knows what work to do, and the work it will be doing that
hardware with, we can start it:

    .start()
