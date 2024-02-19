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

## MySQL config

<h2 id="set_up_database">Set up a database</h2>
<p>In this step, you&rsquo;ll create the database you&rsquo;ll be working with. You&rsquo;ll use
the CLI for the DBMS itself to create the database and table, as well as to
add data.</p>
<p>You&rsquo;ll be creating a database with data about vintage jazz recordings on vinyl.</p>
<p>The code here uses the <a href="https://dev.mysql.com/doc/refman/8.0/en/mysql.html" rel="noreferrer" target="_blank">MySQL CLI</a>,
but most DBMSes have their own CLI with similar features.</p>
<ol>
<li>
<p>Open a new command prompt.</p>
</li>
<li>
<p>At the command line, log into your DBMS, as in the following example for
MySQL.</p>
<pre><code>$ mysql -u root -p
Enter password:

mysql&gt;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'; flush privileges;
</code></pre>
</li>
<li>
<p>At the <code>mysql</code> command prompt, create a database.</p>
<pre><code>mysql&gt; create database recordings;
</code></pre>
</li>
<li>
<p>Change to the database you just created so you can add tables.</p>
<pre><code>mysql&gt; use recordings;
Database changed
</code></pre>
</li>

<p>From the <code>mysql</code> command prompt, run the script you just created.</p>
<p>You&rsquo;ll use the <code>source</code> command in the following form:</p>
<pre><code>mysql&gt; source /path/to/create-tables.sql
</code></pre>
</li>


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
