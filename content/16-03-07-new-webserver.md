+++
Categories = []
Description = ""
Tags = []
date = "2016-03-07T06:38:55Z"
title = "New Webserver, New Website!"
+++

Recently I was introduced to this lovely little webserver called [Caddy](https://caddyserver.com). I will write another blog post in time about exactly how awesome Caddy is; suffice to say zero-configuration HTTPS, sane and secure defaults and a wonderful configuration syntax made me fall in love with it straightaway.

As I'm in the middle of a server move away from OVH/DigitalOcean towards RamNode (this server costs me less than £3 a month, and that's not even their cheapest offering!), I thought I'd deploy Caddy and give it a go, and also give my website a big ol' overhaul.

Well, this is the result! My bloaty old `hugo`-based landing page has been replaced with a pretty little page based on the Skeleton web framework, and while still generated with `hugo`, my blog is now using the beautifully minimalist [liquorice](https://github.com/eliasson/liquorice/) theme from Markus Eliasson. I've still got some tweaking to do, but I'm already very pleased with the result.

The things on my migration-related to-do list right now are the following:

	- migrate my mailserver from DigitalOcean to a RamNode VPS
	- deploy or develop some kind of image host to handle my blog's images
	- deploy some self-hosted image gallery/flickr alternative to show off the photos I actually take
	- clean up my github, deploy gitolite or gogs on this server as a decentralised alternative
	- publish some of these draft blogposts I've had hanging around for months
