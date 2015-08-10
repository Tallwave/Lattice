# Lattice
[![Build Status](https://travis-ci.org/Tallwave/ReusableBehaviors.svg)](https://travis-ci.org/Tallwave/ReusableBehaviors)

*An interlaced structure or pattern fastened together, used typically as support.*

A lot of iOS development is boilerplate code. How many times have you written code to restrict the length of text in a `UITextField`? How many more times do you want to do that? Yeah, me too.

Lattice aims to extract all that code into a group of reusable classes, or "Behaviors" that can be combined to quickly provide a ton of functionality to various UI classes.

Further, inheritance chains can get brittle. Once you get more than one or two generations in you always discover a scenario that you didn't originally think about. You might even find yourself thinking, "Well if Swift just had multiple inheritance...". That way leads to madness though, so Lattice favors composition over inheritance. You can combine multiple behaviors. This does mean that you can shoot yourself in the foot if you do something like adding a `MinLengthValidator` of 10 and a `MaxLengthValidator` of 5. Workaround: don't do that.

Here's the good part. Each of these Behaviors is designed to be dropped into Interface Builder as plain old objects. Once you wire a couple of `IBOutlet`s up, you're done. This means that your View Controllers are not cluttered up with dumb stuff like Validation and field operators. 

This was implemented around Storyboards. It might work with regular old Xibs, but maybe not.

A big thank you to [Krzysztof Zabłocki](http://www.objc.io/issues/13-architecture/behaviors/) for the idea. I ported over some of his code to Swift.

# Next Steps
1. ~~Right now this is just a sample project. Move all the useful classes out to into a library.~~
2. ~~Tests! Also add something like CircleCI.~~ Using [Travis](https://travis-ci.org/Tallwave/ReusableBehaviors)
3. Add more (a lot more) behaviors.
   * Subclass NumberMasker for CreditCard, Phone, Time
4. ~~Rename~~
5. Release as a Cocoapod.

# Contribution
1. Fork this project.
2. Make changes.
3. Submit a Pull Request.

[Here's a workflow describing how that should work](http://blog.swilliams.me/words/2015/06/30/basic-github-workflow-for-collaboration/)
