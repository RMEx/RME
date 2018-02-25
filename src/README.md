# Notice for contributors

RME is released as one single file (`RME.rb`), but we work on a divided version of it.

All the scripts here stands in three categories:

### RME
> the actual RME
- `SDK.rb` => development kit + defines the version, the configuration
- `Database.rb` => provides two custom databases
- `Internal.rb` => internals data structures
- `EvEx.rb` => classes/modules that extends RM, used with RME commands
- `Commands.rb` => all the commands
- `Incubator.rb` => experimenting weird stuffs here before integration
- `SDK.Gui.rb` => development kit for gui-based tools
- `Tools.rb` => gui-based tools (command-tester, tone-tester...)
### samples
> generates samples for documentation
- `Event_printer.rb` => converts events to HTML and BBcode
- `SDK.Sample.rb` => development kit for samples
- `Samples.rb` => declares the common events to use as sample in documentation
### documentation
> generates documentation
- `DocGenerator.rb` => used to generate the documentation
- `Doc.rb` => here we write the documentation
- `Process.Doc.rb` => generates `doc.js`, `doc_report.csv`, `RME.rb`

**`RME.rb` is generated from the RME scripts, excluding the *samples* and *documentation* scripts that only stands for developers and contributors**

To work on all this stuff, we each create one VXAce project, called "**project**", in our RME folder cloned from GitHub

The `.gitignore` serve to only pull and push the `project/Data/CommonEvents.rvdata2`, not the hole **project**.

**Be careful not to overwrite this file!**

***

# How to initialize your own RME dev *"project"*

## Create the project
- Go in VX Ace, File > New project
- Keep **Project1** as project name and choose the cloned GitHub RME folder
- Close the project
- Drag and drop the `project/Data` folder into your `Project1/` folder (replace `CommonEvents.rvdata2`)
- Delete `project` and rename `Project1` "`project`"

## Load the RME scripts
- Open back the project
- Add [scripts-loader](https://github.com/RMEx/scripts-externalizer/blob/master/scripts-loader.rb) in Materials
- In the configuration of **scripts-loader**, replace :
  ```
  LOAD_FROM = "Scripts"  # Load the scripts from the folder you want.
                         # Can be "C:/.../MyScripts/" or "../../MyScripts/"
  ```
  By :
  ```
  $STAGING = true
  LOAD_FROM = "../src"
  ```
That's all.

***Thanks for contributing to RME!***