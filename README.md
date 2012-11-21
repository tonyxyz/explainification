# explainification #

Explainifies ruby objects in the console, showing you the source structure and making your life a tiny bit easier.

Default output shows the mixins and superclasses related to any object and what methods have been defined where.  
Additionally the source of any method can been printed directly to the console.  

### Current Version 0.0.0 #

You're currently looking at a placeholder project that contains this readme and little else.

You can build and run the gem, if you're some kind of ultra-early adopter, like this:

    cd myprojectshome
    git clone https://github.com/tonyxyz/explainification.git
    cd explainification
    gem build explainification.gemspecgem install explainification-0.0.0.gem
    rvm use 1.9.3-p194  # or any other 1.9.x - probably won't work with anything earlier
    rvm gemset use global
    gem install explainification-0.0.0.gem
    cd someotherdirectoryentirely
    irb
    > require 'explainification'
    > String.explainify

