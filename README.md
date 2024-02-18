# Go Development Environment with Docker

This repository provides a Dockerized development environment for Go, including the official Go image, Vim, and Bash. It's a convenient way to set up a consistent and isolated development environment for your Go projects.

## Prerequisites

- [Docker](https://www.docker.com/) installed on your machine

## Getting Started

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/rotcivDev/golang-dev.git &&
    cd golang-dev
    ```

2. Build the Docker image:

    ```bash
    docker compose build
    ```

3. Run the Docker container:

    ```bash
    docker compose run golang-dev
    ```

    This command will drop you into a Bash shell inside the container.

<h1>Tutorial: Getting started with multi-module workspaces</h1>






<div id="nav" class="TOC"></div>



<p>This tutorial introduces the basics of multi-module workspaces in Go.
With multi-module workspaces, you can tell the Go command that you&rsquo;re
writing code in multiple modules at the same time and easily build and
run code in those modules.</p>
<p>In this tutorial, you&rsquo;ll create two modules in a shared multi-module
workspace, make changes across those modules, and see the results
of those changes in a build.</p>
<p><strong>Note:</strong> For other tutorials, see <a href="/doc/tutorial/index.html">Tutorials</a>.</p>
<h2 id="prerequisites">Prerequisites</h2>
<ul>
<li><strong>An installation of Go 1.18 or later.</strong></li>
<li><strong>A tool to edit your code.</strong> Any text editor you have will work fine.</li>
<li><strong>A command terminal.</strong> Go works well using any terminal on Linux and Mac,
and on PowerShell or cmd in Windows.</li>
</ul>
<p>This tutorial requires go1.18 or later. Make sure you&rsquo;ve installed Go at Go 1.18 or later using the
links at <a href="/dl">go.dev/dl</a>.</p>
<h2 id="create_folder">Create a module for your code</h2>
<p>To begin, create a module for the code you’ll write.</p>
<ol>
<li>
<p>Open a command prompt and change to your home directory.</p>
<p>On Linux or Mac:</p>
<pre><code>$ cd
</code></pre>
<p>On Windows:</p>
<pre><code>C:\&gt; cd %HOMEPATH%
</code></pre>
<p>The rest of the tutorial will show a $ as the prompt. The commands you use
will work on Windows too.</p>
</li>
<li>
<p>From the command prompt, create a directory for your code called workspace.</p>
<pre><code>$ mkdir workspace
$ cd workspace
</code></pre>
</li>
<li>
<p>Initialize the module</p>
<p>Our example will create a new module <code>hello</code> that will depend on the golang.org/x/example module.</p>
<p>Create the hello module:</p>
<pre><code>$ mkdir hello
$ cd hello
$ go mod init example.com/hello
go: creating new go.mod: module example.com/hello
</code></pre>
<p>Add a dependency on the golang.org/x/example/hello/reverse package by using <code>go get</code>.</p>
<pre><code>$ go get golang.org/x/example/hello/reverse
</code></pre>
<p>Create hello.go in the hello directory with the following contents:</p>
<pre><code>package main

import (
    &quot;fmt&quot;

    &quot;golang.org/x/example/hello/reverse&quot;
)

func main() {
    fmt.Println(reverse.String(&quot;Hello&quot;))
}
</code></pre>
<p>Now, run the hello program:</p>
<pre><code>$ go run .
olleH
</code></pre>
</li>
</ol>
<h2 id="create-the-workspace">Create the workspace</h2>
<p>In this step, we&rsquo;ll create a <code>go.work</code> file to specify a workspace with the module.</p>
<h4 id="initialize-the-workspace">Initialize the workspace</h4>
<p>In the <code>workspace</code> directory, run:</p>
<pre><code>$ go work init ./hello
</code></pre>
<p>The <code>go work init</code> command tells <code>go</code> to create a <code>go.work</code> file
for a workspace containing the modules in the <code>./hello</code>
directory.</p>
<p>The <code>go</code> command produces a <code>go.work</code> file that looks like this:</p>
<pre><code>go 1.18

use ./hello
</code></pre>
<p>The <code>go.work</code> file has similar syntax to <code>go.mod</code>.</p>
<p>The <code>go</code> directive tells Go which version of Go the file should be
interpreted with. It&rsquo;s similar to the <code>go</code> directive in the <code>go.mod</code>
file.</p>
<p>The <code>use</code> directive tells Go that the module in the <code>hello</code>
directory should be main modules when doing a build.</p>
<p>So in any subdirectory of <code>workspace</code> the module will be active.</p>
<h4 id="run-the-program-in-the-workspace-directory">Run the program in the workspace directory</h4>
<p>In the <code>workspace</code> directory, run:</p>
<pre><code>$ go run ./hello
olleH
</code></pre>
<p>The Go command includes all the modules in the workspace as main modules. This allows us
to refer to a package in the module, even outside the module. Running the <code>go run</code> command
outside the module or the workspace would result in an error because the <code>go</code> command
wouldn&rsquo;t know which modules to use.</p>
<p>Next, we&rsquo;ll add a local copy of the <code>golang.org/x/example/hello</code> module to the workspace.
That module is stored in a subdirectory of the <code>go.googlesource.com/example</code> Git repository.
We&rsquo;ll then add a new function to the <code>reverse</code> package that we can use instead of <code>String</code>.</p>
<h2 id="download-and-modify-the-golangorgxexamplehello-module">Download and modify the <code>golang.org/x/example/hello</code> module</h2>
<p>In this step, we&rsquo;ll download a copy of the Git repo containing the <code>golang.org/x/example/hello</code> module,
add it to the workspace, and then add a new function to it that we will use from the hello program.</p>
<ol>
<li>
<p>Clone the repository</p>
<p>From the workspace directory, run the <code>git</code> command to clone the repository:</p>
<pre><code>$ git clone https://go.googlesource.com/example
Cloning into 'example'...
remote: Total 165 (delta 27), reused 165 (delta 27)
Receiving objects: 100% (165/165), 434.18 KiB | 1022.00 KiB/s, done.
Resolving deltas: 100% (27/27), done.
</code></pre>
</li>
<li>
<p>Add the module to the workspace</p>
<p>The Git repo was just checked out into <code>./example</code>.
The source code for the <code>golang.org/x/example/hello</code> module is in <code>./example/hello</code>.
Add it to the workspace:</p>
<pre><code>$ go work use ./example/hello
</code></pre>
<p>The <code>go work use</code> command adds a new module to the go.work file. It will now look like this:</p>
<pre><code>go 1.18

use (
    ./hello
    ./example/hello
)
</code></pre>
<p>The module now includes both the <code>example.com/hello</code> module and the <code>golang.org/x/example/hello</code> module,
which provides the <code>golang.org/x/example/hello/reverse</code> package.</p>
<p>This will allow us to use the new code we will write in our copy of the <code>reverse</code> package
instead of the version of the package in the module cache
that we downloaded with the <code>go get</code> command.</p>
</li>
<li>
<p>Add the new function.</p>
<p>We&rsquo;ll add a new function to reverse a number to the <code>golang.org/x/example/hello/reverse</code> package.</p>
<p>Create a new file named <code>int.go</code> in the <code>workspace/example/hello/reverse</code> directory containing the following contents:</p>
<pre><code>package reverse

import &quot;strconv&quot;

// Int returns the decimal reversal of the integer i.
func Int(i int) int {
    i, _ = strconv.Atoi(String(strconv.Itoa(i)))
    return i
}
</code></pre>
</li>
<li>
<p>Modify the hello program to use the function.</p>
<p>Modify the contents of <code>workspace/hello/hello.go</code> to contain the following contents:</p>
<pre><code>package main

import (
    &quot;fmt&quot;

    &quot;golang.org/x/example/hello/reverse&quot;
)

func main() {
    fmt.Println(reverse.String(&quot;Hello&quot;), reverse.Int(24601))
}
</code></pre>
</li>
</ol>
<h4 id="run-the-code-in-the-workspace">Run the code in the workspace</h4>
<p>From the workspace directory, run</p>
<pre><code>$ go run ./hello
olleH 10642
</code></pre>
<p>The Go command finds the <code>example.com/hello</code> module specified in the
command line in the <code>hello</code> directory specified by the <code>go.work</code>
file, and similarly resolves the <code>golang.org/x/example/hello/reverse</code> import using
the <code>go.work</code> file.</p>
<p><code>go.work</code> can be used instead of adding <a href="/ref/mod#go-mod-file-replace"><code>replace</code></a>
directives to work across multiple modules.</p>
<p>Since the two modules are in the same workspace it&rsquo;s easy
to make a change in one module and use it in another.</p>
<h4 id="future-step">Future step</h4>
<p>Now, to properly release these modules we&rsquo;d need to make a release of the <code>golang.org/x/example/hello</code>
module, for example at <code>v0.1.0</code>. This is usually done by tagging a commit on the module&rsquo;s version
control repository. See the
<a href="/doc/modules/release-workflow">module release workflow documentation</a>
for more details. Once the release is done, we can increase the requirement on the
<code>golang.org/x/example/hello</code> module in <code>hello/go.mod</code>:</p>
<pre><code>cd hello
go get golang.org/x/example/hello@v0.1.0
</code></pre>
<p>That way, the <code>go</code> command can properly resolve the modules outside the workspace.</p>
<h2 id="learn-more-about-workspaces">Learn more about workspaces</h2>
<p>The <code>go</code> command has a couple of subcommands for working with workspaces in addition to <code>go work init</code> which
we saw earlier in the tutorial:</p>
<ul>
<li><code>go work use [-r] [dir]</code> adds a <code>use</code> directive to the <code>go.work</code> file for <code>dir</code>,
if it exists, and removes the <code>use</code> directory if the argument directory doesn&rsquo;t exist. The <code>-r</code>
flag examines subdirectories of <code>dir</code> recursively.</li>
<li><code>go work edit</code> edits the <code>go.work</code> file similarly to <code>go mod edit</code></li>
<li><code>go work sync</code> syncs dependencies from the workspace&rsquo;s build list into each of the workspace modules.</li>
</ul>
<p>See <a href="/ref/mod#workspaces">Workspaces</a> in the Go Modules Reference for more detail on
workspaces and <code>go.work</code> files.</p>



## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
