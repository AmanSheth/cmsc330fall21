# Project 0: Setup
Due: September 14, 2021 at 11:59 PM

This project is simply to get your system ready.  You will "submit" this project for a grade.  The good-faith attempt (GFA) rule **does not apply** to this project.

## NOTES:
### Problem with OPAM?
If you are failing the public test with error "The wrong version of OPAM is installed. Expected '2.0' Actual '2.1'", modify line 10 in `public.rb` from
```
OPAM_VERSION = "2.0"
```
to
```
OPAM_VERSION = "2.1"
```

### Do you have a macbook with an M1 chip?
Follow the directions for macOS, but do the following for Step 6 instead:

- We will be using OCaml version 4.12.0.  Run `ocaml -version` to check which version is currently installed
- If you are already on 4.12.0, you can skip to the final step in this list.
- Run `opam update`
- If you are on another version, run `opam switch 4.12.0`.  If you get an error saying that switch is not currently installed, run `opam switch create 4.12.0`.
- To wrap up, let's make sure you don't fail the validation test. Modify line 9 in `public.rb` from 
    ```
    OCAML_VERSION = "4.11"
    ```
    to
    ```
    OCAML_VERSION = "4.12"
    ```


## Languages and Packages

In this course, we will primarily be using Ruby and OCaml.  Below is a summary of the packages that need to be installed.  You do not need to use these links, they are just for reference or learning more about the languages and/or packages.  You can skip below to the instructions.

- [Git](https://git-scm.com/)
- [Ruby](https://www.ruby-lang.org)
    - [minitest](https://rubygems.org/gems/minitest)
    - [sqlite3](https://rubygems.org/gems/sqlite3)
    - [sinatra](https://rubygems.org/gems/sinatra)
- [OCaml](http://ocaml.org)
    - [OPAM](https://opam.ocaml.org)
    - [OUnit](https://opam.ocaml.org/packages/ounit)
    - [dune](https://opam.ocaml.org/packages/dune)
    - [utop](https://opam.ocaml.org/packages/utop)
- [Rust](https://www.rust-lang.org)
- [SQLite3](https://sqlite.org)
- [Graphviz](http://graphviz.org)

## Instructions

First, you will need to clone this repository to your local filesystem.  You'll only have to do this once this semester (unless you have multiple computers or delete the repository).  To do this, run:

```
git clone https://github.com/anwarmamat/cmsc330fall21
```

The files in the `project0` folder will be used for the [Verifying Setup](#verifying-setup) section at the bottom.

The following sections will help you install the necessary packages and programs on your operating system.  Some steps may take a long time, please be patient.  **Read all instructions very carefully.**

The output of each command is important, please pay careful attention to what each one prints.  If you encounter an error message, do not ignore it.  We will be available in office hours to help you get set up if you run into problems.  As a general rule, no output means the command executed successfully.

**Please skip to the section below that corresponds with your operating system.**

### Linux (NOT WSL)

These instructions assume you have a Debian-based system (e.g. Ubuntu).  If you have a different distribution, you will have to find and download the corresponding packages in your native package manager.  Note that the packages there may have slightly different names.

1. Firstly, install the basic dependencies:
    - Run `sudo apt update` to update your local package listing
    - Run `sudo apt install ruby-dev sqlite3 libsqlite3-dev ocaml ocaml-native-compilers camlp4 make m4 curl graphviz libssl-dev pkg-config`
2. Install some Ruby gems
    - Run `sudo gem install minitest sqlite3 sinatra`
    - If it hangs on `Installing ri documentation for sinatra`, just hit Ctrl+C.  It will have successfully installed anyway
3. Install and initialize the OCaml package manager
    - Run `sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)` (when prompted for the installation location, just hit enter to select the default)
        - Run `opam --version`.  You should be on version 2 (followed by some versions, just make sure the major version is 2).  Check out [the manual](https://opam.ocaml.org/doc/Install.html) if this is not the case, you may have to follow special directions for your particular operating system and version.
        - If you encounter any issues, or are running a different flavor of linux, check out [the manual](https://opam.ocaml.org/doc/Install.html)
    - Run `opam init`
    - If it hangs at "Fetching repository information" press Enter. This may take a while, be patient
    - When prompted to modify `~/.profile` (or another file), type "n", but remember the filename
    - Open `~/.profile` (or the file mentioned above) in your text editor
    - Add the line `` eval `opam config env` `` (note these are backticks, not single quotes)
    - Save the file
    - Run `source ~/.profile` (or the file you just edited)
4. Initialize OCaml
    - We will be using OCaml version 4.11.0.  Run `ocaml -version` to check which version is currently installed
    - If you are already on 4.11.0, you can skip to #5
    - Run `opam update`
    - If you are on another version, run `opam switch 4.11.0`.  If you get an error saying that switch is not currently installed, run `opam switch create 4.11.0`.  This may take a while, please be patient
    - Run `eval $(opam env)`
    - Ensure you are now on the correct version by running `ocaml -version`
5. Install OCaml packages
    - Run `opam install ocamlfind ounit utop dune qcheck`
6. Install Rust
    - Go to [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install) and run the installation command provided
    - If prompted, just select the defaults
    - Append `~/.cargo/bin` to the `PATH` environment variable. Frist, do `echo $SHELL`.
      - If `echo $SHELL` gives `/bin/zsh`, do `echo "export PATH=$PATH:~/.cargo/bin" >> ~/.bashrc`
      - If `echo $SHELL` gives `/bin/bash`, do `echo "export PATH=$PATH:~/.cargo/bin" >> ~/.zshrc`
7. Install gradescope-submit
    - Run `cargo install gradescope-submit`.  If this fails, try closing and re-opening your terminal window.

### Windows

*This will only work on Windows 10.  If you are on an older version, you will probably need to set up a Linux VM.*

1. Follow the directions [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10) to install the Windows Subsystem for Linux
2. Install the basic dependencies:
    - Run `sudo apt update && sudo apt upgrade` to update your local package listing
    - Run `sudo apt install ruby-dev sqlite3 libsqlite3-dev ocaml ocaml-native-compilers camlp4 make m4 curl graphviz libssl-dev pkg-config`
3. Install some Ruby gems
    - Run `sudo gem install minitest sqlite3 sinatra`
    - If it hangs on `Installing ri documentation for sinatra`, just hit Ctrl+C.  It will have successfully installed anyway
4. Install and initialize the OCaml package manager
    - Run `sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)` (when prompted for the installation location, just hit enter to select the default)
        - Run `opam --version`.  You should be on version 2 (followed by some versions, just make sure the major version is 2).  Check out [the manual](https://opam.ocaml.org/doc/Install.html) if this is not the case, you may have to follow special directions for your particular operating system and version.
        - If you encounter any issues, or are running a different flavor of linux, check out [the manual](https://opam.ocaml.org/doc/Install.html)
    - Run `opam init --disable-sandboxing`
    - If it hangs at "Fetching repository information" press Enter. This may take a while, be patient
    - When prompted to modify `~/.profile` (or another file), type "n", but remember the filename
    - Open `~/.profile` (or the file mentioned above) in your text editor
    - Add the line `` eval `opam config env` `` (note these are backticks, not single quotes)
    - Save the file
    - Run `source ~/.profile` (or the file you just edited)
5. Initialize OCaml
    - We will be using OCaml version 4.11.0.  Run `ocaml -version` to check which version is currently installed
    - If you are already on 4.11.0, you can skip to #6
    - Run `opam update`
    - If you are on another version, run `opam switch 4.11.0`.  If you get an error saying that switch is not currently installed, run `opam switch create 4.11.0`.  This may take a while, please be patient
    - Run `eval $(opam env)`
    - Ensure you are now on the correct version by running `ocaml -version`
6. Install OCaml packages
    - Run `opam install ocamlfind ounit utop dune qcheck`
7. Install Rust
    - Go to [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install) and run the installation command provided
    - If prompted, just select the defaults
    - Append `~/.cargo/bin` to the `PATH` environment variable. Frist, do `echo $SHELL`.
      - If `echo $SHELL` gives `/bin/zsh`, do `echo "export PATH=$PATH:~/.cargo/bin" >> ~/.bashrc`
      - If `echo $SHELL` gives `/bin/bash`, do `echo "export PATH=$PATH:~/.cargo/bin" >> ~/.zshrc`
8. Install gradescope-submit
    - Run `cargo install gradescope-submit`.  If this fails, try closing and
      re-opening your terminal window.

### macOS

1. Install the Homebrew package manager (Updated in Fall 2021)
    - Run `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Check your Ruby version by running `ruby -v`.  If it's older than 2.2.2,
   you'll need to install a newer version using `brew install ruby`
3. Install the basic dependencies
    - Run `brew install ocaml opam graphviz openssl`
4. Install some Ruby gems
    - Run `sudo gem install minitest sqlite3 sinatra`
    - If it hangs on `Installing ri documentation for sinatra`, just hit Ctrl+C.
      It will have successfully installed anyway
5. Initialize the OCaml package manager
    - Run `opam init`
    - When prompted to modify `~/.zshrc` or `~/.bash_profile` (or similar file), type "y"
    - Run  `source ~/.zshrc` or `source ~/.bash_profile` (or the file mentioned above)
6. Initialize OCaml
    - We will be using OCaml version 4.12.0.  Run `ocaml -version` to check
      which version is currently installed
    - If you are already on 4.12.0, you can skip to #7
    - Run `opam update`
    - If you are on another version, run `opam switch 4.12.0`.  If you get an
      error saying that switch is not currently installed, run `opam switch
      create 4.12.0`.  This may take a while, please be patient
    - Run `eval $(opam env)`
    - Ensure you are now on the correct version by running `ocaml -version`
7. Install OCaml packages
    - Run `opam install ocamlfind ounit utop dune qcheck`
8. Install Rust
    - Go to [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install) and run the installation command provided
    - If prompted, just select the defaults
    - Append `~/.cargo/bin` to the `PATH` environment variable. Frist, do `echo $SHELL`.
      - If `echo $SHELL` gives `/bin/zsh`, do `echo "export PATH=$PATH:~/.cargo/bin" >> ~/.bashrc`
      - If `echo $SHELL` gives `/bin/bash`, do `echo "export PATH=$PATH:~/.cargo/bin" >> ~/.zshrc`
9. Install gradescope-submit
    - Run `cargo install gradescope-submit`.  If this fails, try closing and
      re-opening your terminal window.

## Verifying Setup

This is the graded part of this project.  To verify that you have the correct
versions installed, run `ruby test/public/public.rb` in this directory.  You
should not get any errors.  This will create a file called p0.report.  Submit
this file by running `gradescope-submit` in the project folder.  You will have
to enter your credentials the first time, but for future projects you should not
have to.  Alternatively, you can manually submit the file to Gradescope by
uploading the p0.report file to the appropriate assignment.

## `gradescope-submit` Troubleshooting
### Incorrect Passwords 
Make sure that the email address and password you entered is of the account
where your CMSC 330 course enrollment shows up. (If you login through "school
credentials" option and don't remember your **Gradescope** password, please
reset it.) Great chances are that people have multiple Gradescope accounts, and
it is suggested to merge them before trying to submit by the program.

### HTTP Errors
Remove the `gradescope-submit` config file by doing
`rm -r ~/.gradescope-submit`. Then, refer to the troubleshooting for incorrect
passwords and try it again.
