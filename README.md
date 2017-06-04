# CoCalc

One easy way to get started with Ximera is to use CoCalc (formerly SageMathCloud), a web-based cloud computing platform.  CoCalc provides an Ubuntu-based linux environment with a LaTeX editor.  By following the instructions below, you can configure CoCalc to edit Ximera worksheets.

## Getting started

1. Go to https://cocalc.com/ and create a project that has internet access (which requires a membership to [cocalc.com](http://cocalc.com/))
2. In your newly created project, click on the large "Create or Upload Files" button.
3. From among the options, choose "Terminal" to create a terminal where you will be able to enter commands.
4. Wait for the terminal to open.
4. In the terminal, run the two commands
```
curl -OL http://xandbox.github.io/cocalc/install.sh
source install.sh
```
This will populate your CoCalc project with the files necessary to use Ximera.
5. Click on "Files" to view the files that have been downloaded into your project.
6. Choose the directory "xandbox" from the list of files.
7. Choose "first.tex"
8. Make some edits and click "Save."
9. Click on the terminal in your project.
10. Type `cd xandbox` to enter your xandbox directory.
10. Type `xake name` followed by a space and then a short lowercase name for your xandbox.  This could be your first name, for instance.  The name you choose must be globally unique, so be creative!  For instance, `xake name turnloon` is what I will choose.
10. Type `xake bake` to compile your first.tex into an html file.  If you run into errors, you can go back to your first.tex file and make additional edits.
10. 
10. Type `git add first.tex` to stage the changes you've made to the first.tex file.
10. Type `git commit -m "My first edit"` to commit the staged changes.
10. Type `xake frost` to create a publication commit on top of your source commit.
10. Type `xake serve` to share your content with the world.  For instance, my content will appear at https://ximera.osu.edu/turnloon/first
