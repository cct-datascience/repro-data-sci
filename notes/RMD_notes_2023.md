# Workshop notes

## Session 1 - Project Management 9/5/23 

- [ ] record (to the cloud) - avoid picture in picture
- [ ] if there's time - breakout rooms to discuss a project that this could apply to

In-session

:+1: on the fillable boxes on the Quarto slide, they just make me happy

Had some converdation about .RDS vs .RData - add this to the teaching notes.

Sticky points:
- putting files in the right directory (not too sticky)


In this session, they created .Rprojects and dealt a fair amount with file path headaches.

****

## Session 2 - Shell and filesystems 9/7/23

### Teaching script

#### Welcome

Welcome back everyone, good to see you.

As a reminder, here are links to the course website: https://cct-datascience.github.io/repro-data-sci and today's slides: https://cct-datascience.github.io/repro-data-sci/lessons/2-shell/slides.html

And, here's the video link from last week. We're still figuring out how to get it to load as a playlist. https://youtu.be/_hU9cNHylHM

#### Review of last session

First let's take a look back at Tuesday's session.

- What questions do you have about the workshop or anything we covered on Tuesday?

- Second, show of hands, who has had a chance to think about the "homework"? 
- Let's get into breakout rooms of 4-5 people to talk about it. It's ok if you haven't had a chance to do anything yet, but what comes up for you when you think about applying these ideas to things you're currently working on? Talk for about 5 minutes, and we'll ask for volunteers to report back when we regroup.

#### Learning objectives for today

Today we're going to be talking about the shell (which is, if you're familiar, your command line or terminal) and particularly how we can use it to navigate file systems.

Then we'll have a little bit of a review of Tuesday, where we'll encourage using R projects so you can (mostly) avoid having to navigate really complex file system problems. 

Lastly, we'll take some time to talk about different options for finding help on these topics.

#### What is the shell?

Ok, for starters. Show of hands, how many folks here have used the command-line shell before?

Does anyone want to offer a definition of it?

So the shell is how we interact with our computer's operating system. One way we can control our computer is via a GUI, where we navigate and point and click on things. The command line shell is a way for us to interact with the computer without necessarily using a GUI. Instead of pointing and clicking, we talk to the computer through written commands. That can be a single line to do something like open a folder or create a new file, or you can write whole scripts and programs for the shell. In this workshop we're going to have an introduction to shell so that we can use it when it pops up later. 

Depending on your computer you might use different programs to run command-line shell. If you're on a Mac; it's going to be your Terminal program. On Windows, you have some options, but they're all going to be command-prompt programs.

There are different versions of the shell you can use that can have some subtle differences in how they look and how they work in the details. If you've heard of bash, that's a popular one. On Windows, we're going to install a program called Git Bash that will let us use an interface very similar to bash. More recent Macs default to a different interface called zsh, but you can configure them back to bash if you want. 

#### Why learn the shell?

If you're not familiar with it, the shell can feel a little intimidating at first. But, a little bit of familiarity with the shell will come in handy for data-intensive and reproducible research.

First, a fair number of scientific programs are command line only; they don't have a corresponding GUI. Or maybe one exists, but we may not want to have to use it. For our purposes, we'll be working with the program git later in the series. Git has both a command line and various GUI interfaces. Personally, I prefer to work with the command line interface in the day-to-day because it's more efficient and more stable than the various GUIs. So, it's worth being comfortable interacting via the command line so we can use those. 

Second, sometimes we're going to want to be able to batch large operations within our filesystem. You can write scripts for the shell that will handle this, instead of having to repeat the same sequence of point and clicks over and over and over again.

And third, shell commands can be _really_ important for interacting with remote computers. For example (and I'm actually not certain of this from my own experience at UA, but this has very much been my experience with other servers and high-performance computing setups). That you'll need to use at least a little bit of shell scripting to send your work to the HPC, or to get results and such back on to your machine.

#### Shell in this workshop

In this workshop, we'll be using just a little bit of shell sprinkled in. As I mentioned, we're going to be using git and GitHub to handle version control starting next week. For that, we're going to start by teaching you some command-line operations for using Git. 

In this lesson, we're going to use command line to move around our file systems. It can be really important to have a mental model of your computer's file system and where you're working. 

And it'll pop up later when we get going with Quarto and literate programming in a few weeks.

#### Let's get set up!

Everyone will need to get set up with a program for shell scripting and git (because we'll use that later). For Mac users, this usually comes built in, but for Windows users we'll need to install it. 

So let's take a minute to break into breakout rooms and get ourselves up and running.

(break into breakout rooms and install things)

Mac: https://git-scm.com/download/mac
Windows: https://git-scm.com/download/win; https://carpentries.github.io/workshop-template/#setup

#### Data download

The next thing is, we'll want to download some toy files so we can practice finding them and moving them. 

Download this https://swcarpentry.github.io/shell-novice/index.html#download-files and save it to your desktop.

At this point, important to note that (especially Windows users) may have multiple desktops. I generally recommend working in your _local_ desktop and not one that's in OneDrive or some other cloud storage.

#### Coding time

Ok, now let's hop over to RStudio. When I'm working on a project I generally work with the shell by using the "Terminal" pane in RStudio. You can also do it by opening Git Bash on Windows or opening Terminal on a Mac, but doing it in RStudio cuts down on clicking.

(Open RStudio)

Show different panes and location of the Terminal pane.

So here in RStudio we have a pane that can communicate directly with the shell. It can take a little bit of set-up, first.

First, we want to tell RStudio what shell program we want it to use. You can do this by going to Global Options, Terminal, and selecting bash or Git Bash. You might then need to restart.

Second, I sometimes find that my Terminals are a little buggy on start-up with RStudio. If on Windows you open RStudio and the Terminal Pane isn't working for you, you can create a new terminal. This also comes in handy if you crash or otherwise mess up a terminal.

Ok -- has everyone located their Terminal pane in Rstudio and set it up to use bash? Great.

Now let's start learning a few shell commands. Shell is kind of nice, in that we can learn just a few commands and suddenly be very very powerful.

Let's start by using shell to navigate around our file system. This is going to be exactly analogous to navigating around your files by using the File Explorer in Windows or Finder on a Mac. Or, using the Files pane in RStudio!

For starters, let's run `pwd`. This will print out the file path to where the shell currently "is", which is analogous to which folder you have open in Finder or Explorer. 
Have folks contribute where on their computer they are. 
Show example file system structures.

We can also use `ls`, to look at what is in our current directory. 

We can modify the behavior of commands by using what are called flags. (Show structure of command prompt).

If we want to show the size of files, we can run `ls -s`

And if we want that to show up in human readable form, we can add `ls -sh`.

We can get help for all of these flags using `ls --help`.

So, where are we? We might be in all kinds of different, weird, locations. One of the core things to be able to do in shell is move around from location to location.

We can do this using the `cd` command. To open up a folder, we type `cd <folder_name>`. In this case, we're not using any flags, but we are supplying the folder name as an argument.

To navigate up the file tree, we type `cd ..`

It's good to have an awareness of how your file system is set up. This can help you avoid working in the wrong place or having duplicate copies of your work in different locations. [Demonstrate how my file system is set up and weird]. For me, I like to keep a directory high up in my file system called GitHub, and this contains all of my projects. You may end up with different structures.

When we first open up RStudio, we'll be "in" wherever R Studio is using as the default file location. You can set this using Global Options (show). 

Especially if you're working with a remote computer like a HPC, you may sometimes need to move around working directories or pull files from somewhere else. Let's do a quick exercise navigating to the "shell_lesson_data" that we downloaded to the desktop earlier.

- Work through navigating to shell-lesson-data and troubleshoot. 
- Make the point that this is analogous to clicking around in the files pane.
- Point out using RStudio to syncrhonize files and terminal panes. 

Awesome.

So navigating using the shell is a great skill to have, but it can also be a pain to do day to day. As Eric showed on Tuesday, we can avoid a lot of headaches by using R projects.

If we use an R project, we will open up by default in the working directory for that project. To demonstrate that, let's open our R project from Tuesday. (Do you remember where you saved it?)

Examine the contents of your R project from the Terminal. 

Ok, bonus challenge. Let's copy `shell-lesson-data` to our R project!

To copy a directory, the command is `cp`. We need to supply the path to _what_ we're copying, followed by the path of _where_ to copy it to.

(Find shell_lesson_data using tab completion)

(Run cp without the -r flag, show error)

(Explain -r flag and copy over)

And, last thing. Say we want to delete something!

We can delete individual files using the rm command.

And we can delete whole directories using rm -r. 

OK, that's a lot! 


#### Getting Help

So, the last thing to cover today is, we wanted to have a conversation about where you can get help with topics like the shell, or anything else that we cover in this workshop. 

As we've seen, the --help flags and man pages can be useful.

(Go through Getting Help slides)


#### Homework for next time





### After teaching

#### Impressions

- Did not get all the way to Getting Help
- _I_ felt like things got a little chaotic with the file paths. Next time I would want to emphasize that what works for me isn't going to work for everyone (bc our file systems are set up differently). It would have also been nice to be able to have a participant work through it on their system to show a second example.
- I'm also still a bit unclear (and curious) the why and wherefore of the differences in --help and man between systems. Eldridge suggested it has to do with different dialects between bash and Git Bash.
- A participant asked a really good question about how GitHub, git, RStudio, and shell all fit together (and, if we were using GitHub to interact with the shell - showing me we really need to explain this more clearly).
- For next time, I wonder if there's a way to introduce the concept of the filesystem and the need to move in and out of directories/up and down the tree and give directions relative to the current working directory _before_ getting into the command line. I ended up trying to communicate both those concepts simultaneously and I think it might have come through more easily if we'd started with a mental model of the "giving directions through the tree relative to where you're standing" and then gone over the syntax for communicating those directions to the os. It might mean reframing the lesson as "Filesystems and Command Line Navigation" rather than "CLI and Files"...semantics but subtly significant? Especially as, the primary motivation I was able to articulate for doing CLI in this workshop was file management (for git and remote computers) and running CLI programs (here, git but potentially others). In the context of this workshop, we could do filesystems for the first chunk of lesson 2, then _use_ CLI and the shell to navigate file systems. Then build on the familiarity with CLI from this session to run _programs_ from the CLI (git) in the git lesson. 

#### Send to participants

Email, or slack?

- Bullet list of takeaways
- Materials for a preview of next week
- Reminder of drop-in hours Tuesday

Hi everyone - thanks for a great session yesterday! I'm following-up with a couple of friendly reminders/foreshadowing for next week, and a list of key takeaways from this session for your notes.

1.  Next week we'll be getting into Git and GitHub. For a taste of what's to come, we highly recommend reading this article: [Excuse me, do you have a moment to talk about version control?](https://peerj.com/preprints/3159/)
2.  This session's optional "homework": Create a diagram of your file system, and identify your most often used directories. This can be a good exercise for solidifying a mental model of how your system is set up.
3.  A reminder that if you have questions or are struggling with a particularly involved data problem, we have [Drop-in hours](https://datascience.cct.arizona.edu/drop-in-hours) from 9-10 on Tuesday mornings. You're also more than welcome to book a 1-on-1 appointment with one of us via the calendar links [on our webpage](https://datascience.cct.arizona.edu/)!

Finally, some takeaways from yesterday's session for your contemplation:

- The shell allows us to interact with our computer (run programs, move around and modify directories and files) from the command line.
- We can use the shell from the Terminal pane in RStudio.
- The file system that we interact with in the shell is the same as what we see in Finder/File Explorer/the RStudio Files pane. 
- File systems have a nested treelike structure. When navigating our file system from the command line, we write paths _relative to where we're currently working_.
- Use options, preceded by a hyphen (`-`), to modify the behavior of shell commands. Use `man <command>` or `command --help` to see the available options for a command. 

#### Updates to git lesson

- Consider where to put the Getting Help section
- Write out script


## Session 3 - Git

### Teaching script

#### Title slide

Welcome back!

YouTube link to previous session:

Course website link: https://cct-datascience.github.io/repro-data-sci/

Slides link: https://cct-datascience.github.io/repro-data-sci/lessons/3-git/slides.html#/review-1 

#### Review 1

What are your questions?

#### Review 2

Did you diagram your file system? What did you find?

#### Review 3

Troubleshoot fiel system navigation exercise.

#### Learning objectives

Today we're going to talk about version control.

What is it?

Set it up on your computer. We have it installed, so now we can work on getting some system options set.

And then we'll start using git to work with our R projects.

If we have time, we'll get a little deeper into using git selectively. If not, Eric will cover that on Thursday! _Note to RMD - Or, we could switch this to the "Getting Help" conversation that we wanted to have earlier.

#### Version Control

Version control is a tool for tracking changes with unlimited "undo". 

#### Why learn version control?

Really handy for when:

- You don't want to lose past versions of something, but you also don't want to have seven thousand files
- You want to have a history of a project - analogous to a bench lab notebook
- You want to collaborate on a project across different systems, without getting confused about which version you put where
- You want to collaborate with _other people_ without getting tangled up.

#### Git and GitHub

A quick note to say, Git and GitHub are different but related.

Git is local. GitHub is a client for Git. There are alternatives to GitHub (but not super widely used).

Today we're going to focus on Git, and Eric will help us get started with GitHub on Thursday.

#### Git setup

Let's get staretd interacting with git.

git is basically a command line program. There are GUI interfaces to it, but it's good to be able to do the basics from the CLI.

So, open up your RStudio and let's get a Terminal window open. 

Let's configure your installation of git. 

To use git, we're going to do what's called "Running git commands" from the shell. To run a git command, we type "git" followed by the command, and then the options and arguments. 

`git config` is going to modify our _configuration_ of git. Here we're using the --global option to change it for all of your repos. Set your name and your email. 

#### Next slide

Set text editor.

Go over git command options syntax again.

#### Creating git repositories - follow slides

Use "Show hidden files option". s

#### Modifying files: follow slides

- Introduce git status
- Introduce modifications
- git status
- git add
- git commit
- Modifications to mulitple files
- git add
- git commit
- Use git diff to reveal modifications
- Use git restore to discard modifications
- Use git reset HEAD\~ to go back in time

Note - pending time and vibes, use of time at the end could be to practice modify-add-commit cycle (and not introduce new stuff).

### Post-teaching

- Didn't make it to git diff, git restore, or git reset HEAD
- Add install.packages("usethis)
- Pushing git restore and git reset HEAD\~ until later - after folks have a more established mental model. 

## Session 5 - GitHub II

Got branches and forks through. 



## Session 6 - Data manipulation with R

Todos:

- [ ] add a review exercise or discussion question




## Session 7 

* Start with getting help
* Focus on writing functions to clean data
    * Store 3 different penguin datasets (by island) online at URLS
    * Use writing functions as an opportunity to practice with tidyverse functions
        * incl. tidyselect helpers
        * get a specific goal in mind for cleaning data

* This will be set up for Thursday + purrr + iteration.

Share dplyr cheatsheet https://dplyr.tidyverse.org/#cheat-sheet 

