+++
Categories = []
Description = ""
Tags = []
date = "2016-03-09T08:02:48Z"
title = "Github isn't your CDN"

+++

Somebody pointed me at [this GitHub issue][1] last night. I'd suggest you go read it, but let me summarise what happened to cause the issue to be opened:

1. CocoaPods is a 'Dependency Manager' for the Cocoa language.
2. CocoaPods is using GitHub repo for hosting 'Specs', metadata files that tell CocoaPods where to obtain and how to install a certain library.
3. There are approximately 75k files in this repo.
4. The CocoaPods setup command performs a shallow `git` clone of the entire Specs repo, which fetches the top commit instead of the entire repo history.
5. Due to the way `git` works, this is incredibly expensive, and has kept over 5 GitHub server CPUs pegged at 100% for months.
6. GitHub server watchdogs noticed this, and automatic rate-limiting kicked in.
7. This lead to massively decreased performance of the CocoaPods setup command, often causing the tool to fail entirely as git fetches timed out.

Firstly, I'd like to commend GitHub's Michael Haggerty on his [fantastic response][2] to the issue. It's obvious GitHub really cares about FOSS and keeping their service available to all, and imposing a soft limit on a problematic user where they had every right to say "no thanks you're abusing our service goodbye" is commendable. Without GitHub, the FOSS landscape would look a lot worse than it does today, and I appreciate their attitude.

Now I've gotten that out of the way, onto the point of this post: I believe CocoaPods aren't acting responsibly with their use of GitHub's services, on multiple counts.

The first is that `git` simply doesn't scale to this usecase. It's a version control tool, not a package manager, and it's a version control tool that doesn't scale excellently in the first place. This is further exacerbated by the fact that CocoaPods uses `git` in a very inefficient manner that is very CPU-intensive on the server side. Using `git` in this way was a bad design decision that appears to have been made without anticipating the scale of a tool like CocoaPods.

Homebrew, a package manager for OS X, _also_ uses a GitHub repo to host what it calls 'Formulas', which are roughly equivalent to CocoaPods' Specs. However, Homebrew only ever fetches from the repo when the user explicitly asks for it. This way, it keeps the number of unnecessary fetches to a minimum, and is far less taxing on GitHub's servers.

GitHub are going as far to make code contributions to `git` itself which would increase the efficiency of the CocoaPods tool... While impressive and entirely appreciated by the community, this is not how those patches should have come about.

Secondly, GitHub is a free service. I think this is great, it allows people to host their projects without needing to manage their own infrastructure, which has made collaborative development efforts a lot more accessible to those with limited time and funds. On CocoaPods' website, they state that they are

> LOVINGLY SPONSORED BY Artsy, Button, Capital One, Discontinuity, Fingertips, Heroku, RubyMotion, Sauspiel, Slack, SoundCloud, Stripe and Technology Astronauts.

contrary to this, when pressed about their use of GitHub for hosting, CocoaPods founder Eloy Durán [commented][3] (emphasis my own)

> Scaling and operating this repo is actually quite simple for us as CocoaPods developers whom do not want to take on the burden of having to maintain a cloud service around the clock (users in all time zones) or, frankly, at all. Trying to have a few devs do this, possibly in their spare-time, is a sure way to burn them out. And then there’s also the **funding aspect to such a service.**
>
> ...
>
> For **the ‘HR’ and funding reasons listed above**, I think we’re actually being ‘smarter’ than various other packaging systems...

Now, I don't know about you, but for a project that claims to be sponsored by not one, but _two_ companies in the financial sector, I'd expect they'd be more willing to fund their own infrastructure and pay for administrators to manage that infrastructure. Need I remind you that the node.js dependency manager, npm, manage to operate a similar tool on their own infrastructure, paying their own bills. Why can't CocoaPods, who are within the top five users of GitHub resources?

I've rambled on long enough, so I'll conclude; **I believe CocoaPods are acting in bad faith with regards to their usage of GitHub's service.** GitHub are behaving admirably in striving to accommodate CocoaPods abuse of their service.

FOSS is free because we respect our contributors. CocoaPods need to respect those contributing their infrastructure.


[1]: https://github.com/CocoaPods/CocoaPods/issues/4989
[2]: https://github.com/CocoaPods/CocoaPods/issues/4989#issuecomment-193772935
[3]: https://github.com/CocoaPods/CocoaPods/issues/4989#issuecomment-193810378
