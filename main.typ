#import "@preview/zebraw:0.6.1": *
#import "@preview/vibrant-color:0.2.0": *
#show: zebraw

#show: doc => vibrant-color(
  theme: "green-theme",
  title: "Documentation",
  authors: (
    "Dev team",
  ),
  lang: "en",
  sub-authors: "Skribi",
  description: "An introduction to Skribi, with its specifications",
  subject: "Skribi",
  doc
)

#set document(
  title: "An introduction on Skribi",
)

#set raw(syntaxes: "skribi.sublime-syntax")

= Introduction

This document is created for explaining how to use the Skribi, and having every
decision in the same place. You will find specifications about the language,
a tutorial that explains how to use it, and the basics of how it is made.

= A good start

== Downloading Skribi

All information about downloading Skribi can be found on #link(
  "https://github.com/Dibi-programming-language/Skribi-langage-source"
)[this page]. For now, you will need to build the code yourself.

The best way to use Skribi is to install it using nix:
```sh
nix profile install github:Dibi-programming-language/Skribi-langage-source
```

And run it using:
```sh
skribi [path to file]
```

#line()

If you want to test Skribi, you can use:
```sh
nix run github:Dibi-programming-language/Skribi-langage-source
```

Skribi will not be kept on your system after this command.

== Using skribi

To use Skribi, you may want to provide a Skribi file.

```sh
skribi your_file.skrb
```

Only `.skrb` and `.skribi` are accepted as valid files.

= Specifications

You can write Skribi code anywhere in a Skribi file: you do not need a main
function to start coding.

#warning("None of these specifications are implemented yet.")

== Calling a function

=== Native functions

You can use native functions to communicate with the outside of your script.

The syntax of a native function is:
```skribi
skr_app name(args)
```

This will call the function named ```skribi name```.
We need to specify the ```skribi skr_app``` as it would be considered as a user
defined function otherwise.

#quote([
  Why do we need to make a difference between user defined functions and skribi
  defined functions ?

  #line()

  This is an implementation choice: skribi defined functions are from a limited
  list, and implemented in a totally different way. This allows to perform
  limited checks on these functions.
])


