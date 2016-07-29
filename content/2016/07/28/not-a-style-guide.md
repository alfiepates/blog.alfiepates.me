+++
Categories = []
Description = ""
Tags = []
date = "2016-07-28T22:45:58+01:00"
title = "This is Not a Style Guide"

+++

I hate style guides. All they seem to do is start arguments about style gudes, and lead to a million and one commits that consist only of "style guide fixes" and "turned spaces into tabs", both of which are _entirely damn useless._

Here's what I do, and what I think you should do too.

## Make it readable


The most important thing about code is that it must be readable. If I want to patch your code, I'd quite like to be able to look at said code and figure out what the hell it does.

Code is a method of communication between developers, much as this blogpost is a method of communication - I've made the effort to use paragraphs, etc.

```
what if the entire blogpost looked just like this itd be pretty hard to read right well thats what youre doing with your badly formatted code
```

Okay, maybe that was a bit hyperbolic, but I _have_ run across code that reads just like that. When I see code that looks like that, I can't get into a rhythm, my brain shuts off, and I tend to go make a cup of tea and stop contributing to your project. 

## Tabs n' Spaces


Ugh, Tabs vs Spaces. I've literally lost friends over this argument. 

### Indentation

I use a couple of different indent levels. In `vim`, on my servers, I use an indent of 2 characters. In Brackets on my MacBook, 4. On huge desktop monitors where I've got a lot of space? 6. 

These are values that I've found work _for me_, personally. They may not work for you, and I don't want to inflict them on you. I know people who have bigger AND smaller indentation preferences. We all work on the same code. You know what makes that possible? **Tabs.**

So many languages' style guides dictate using spaces for indentation. Python is one notable example, insisting on two spaces for indentation, and to be completely honest I think that's absurd. Stuff like indentation is completely subjective, and therefore it makes sense to use the character which _doesn't explicitly define an indent size_. 

I hear the argument _"Well, spaces are better because my editor doesn't let you define tab width!"_ quite often. I hate to break it to you, but your editor is crap. Give [Brackets](https://brackets.io) a go. I love it, you probably will too. If Brackets doesn't butter your muffin, then there are many other great editors; I use `vim` on my servers, and I know several people who sing the praises of Atom, even if it doesn't float my personal boat!

### Alignment

There's this one other little thing that I very rarely see mentioned, and that's alignment. For instance, I like to do comments as follows: 

```
var someFunction = function(someArg) {
	return someArg;                                // someComment!
};

var someOtherFunction = function() {
	someFunction("Here is a string.");                                       // someOtherComment!
	return "Here is another much longer string to pad out this line.";       // someLongLineComment!
};
```

I generally put my comments at col 50, or if not on the next available multiple-of-five column that gives it clear separation from the code (at least 5 spaces), and aligned with comments in the same context. This makes a collection of comments that pertain to the same concept immediately identifiable, and keeps the comments separated from the code so it's easier to quickly scan through.

You know how I do this? _Spaces._ Spaces are always 1col wide, and in this case that's exactly the desired behaviour: I'm aligning by columns relative to the right-most code character!

_**Note:** I really wish editors aligned right-most comments automatically. I don't **want** to force my comment alignment preference on you, but right now that's what we have to put up with._


The same goes for arrays/list alignment/whatever, although it's 2AM and I'm slightly too tired to articulate some example code. The basic gist involves tab-indenting to the same indent level as the current context, and then space-aligning. Watch this space for an example code snippet, when I can be bothered.

## Keep the rhythm

When I'm reading through a source file and I come across an inconsistency, it's jarring. Say, most of the variable names in this file are in camelCase, but these three are in snake_case, and this one is in SCREAMING_SNAKE_CASE? What's up with that? 

When contributing to a project, take a look around, see how the rest of the code is written, and take cues from that. If every other variable in the project uses snake_case, you should use it too. 

If you think a certain way of styling your code is preferable, _use it in your own projects_, but make sure you pick up the styling from other projects when contributing to them.

## Avoid shorthand

My god, avoid shorthand. Here's another javascript example:

```
getBigger ++;
getBigger = getBigger + 1;
```

These two lines do exactly the same thing, but one of them describes what it does, and the other doesn't. Sure, if you _know_ javascript shorthand it's not a problem, but what happens if you don't know the shorthand all that well? Well, you run into a problem, you have to pull up the docs, figure out what `++` does, and by the time you've done that you've probably lost your flow.

## Line length restrictions are silly

It's 2016. I have a huge monitor. My editor wraps long lines sensibly. I spread my code out over many shorter lines. 

I do not need to be artifically limiting the lengths of my lines to 80/120/whatever characters. This may have made sense back when we were all using 80col terminals, but _we aren't._ Let your code breathe, damn. 

I also hear _"My editor doesn't wrap code well/at all!"_ a LOT as a justification for manually wrapping lines. Seriously get a better editor, you're missing out. 

---

So, that's that. There's how I write code, and how I try to make it readable to people contributing to my code. You should endeavour to make your code readable too.