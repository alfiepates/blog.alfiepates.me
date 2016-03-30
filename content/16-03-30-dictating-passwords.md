+++
Categories = []
Description = ""
Tags = []
date = "2016-03-30T21:32:30+01:00"
title = "Concept: A solution to the Dictating Passwords problem"

+++

# **DISCLAIMER: Don't implement this.** I am not a cryptographer. If a qualified cryptographer wants to implement this system in such a way that it is secure, I encourage them to (and open-source the result), but please do not attempt to implement this if you are not qualified.

Earlier today, I retweeted this tweet:

<blockquote class="twitter-tweet" data-lang="en-gb"><p lang="en" dir="ltr">In what world is this a good idea? <a href="https://t.co/rN3TE3K5DF">pic.twitter.com/rN3TE3K5DF</a></p>&mdash; Ben Summers (@bensummers) <a href="https://twitter.com/bensummers/status/715219511192977408">30 March 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

As an infosec person, my first reaction was _"Why the hell would you read a password aloud?!"_, but a response to my retweet (and the conversation that ensued) really got me thinking.

<blockquote class="twitter-tweet" data-lang="en-gb"><p lang="en" dir="ltr"><a href="https://twitter.com/bensummers">@bensummers</a> <a href="https://twitter.com/alfiepates">@alfiepates</a> <br>A world where some people have disabilities requiring them to dictate everything. <a href="https://t.co/LC2gR6W2Up">https://t.co/LC2gR6W2Up</a></p>&mdash; @the_real_caurinus ❔ (@caurinus) <a href="https://twitter.com/caurinus/status/715241533377613824">30 March 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Is it possible to securely dictate a password in such a way that an eavesdropper couldn't deduce that password? Allow me to phrase this problem in "Alice and Bob" terms:

> Alice is attempting to prove her identity to Bob. Eve can see what Alice is saying to Bob, but can't see what Bob is saying back. How does Alice prove her identity in such a way that Eve can't "prove" to be Alice after the fact?

I'm also going to propose another constraint: Alice is a human, not a computer. Therefore, Alice cannot perform any 'computations', which include complex string manipulation and suchlike - no Diffie–Hellman here!

After some thought, I have formulated a concept which seems to satisfy these requirements. It is as follows:


Alice has a passphrase made up of common words. For this example, I will use the phrase `Correct Horse Battery Staple`. Bob displays a grid of randomly selected words, some of which are the words in the Alice's passphrase, along with a set of coordinates.

![Grid of words](/img/2016-03-30-dictating-passwords-1.jpeg)

Alice then reads aloud the coordinates for the words in her passphrase.

![Grid of words with coordinates filled in](/img/2016-03-30-dictating-passwords-2.jpeg)

Bob is able to verify the passphrase, while Alice hasn't disclosed any information which allows Eve to construct her passphrase.

There! Simple! As I said above, I'm not a cryptographer and neither are you (unless you are) therefore _please_ do not implement this in your own code. It's a concept, it's an idea, and if you are qualified I'd encourage you to write some actual code that makes this happen in a secure fashion: Accessibility is important.

Caveats
-------

Since this passphrase system is based on "real words", an obvious weakness is that the passphrase must be stored (at least locally) as plaintext. If the passphrase needs to be transmitted, then I'd suggest using a key derivation function such as `scrypt` on the passphrase locally and transmitting the generated key.

There is also the obvious caveat that this system is _extremely_ vulnerable to shoulder-surfing. If Eve can see the grid of words, then all bets are off. In theory, this could be combat by having a longer passphrase (for example, `Correct Nose Horse Shop Battery Staple`), and then Bob asking Alice for a subset of those words. While this wouldn't secure repeated entries of the same passprase, it would certainly protect against single instances of shoulder-surfing.

![Grid of words 2](/img/2016-03-30-dictating-passwords-3.jpeg)
