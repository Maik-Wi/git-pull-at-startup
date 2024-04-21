# Update a Git repository after starting the computer.

This script updates desired repositories upon computer startup. You can also list multiple URLs in line 4. For a repository to be updated from the internet, an internet connection is required. It's possible that your computer may not immediately have a connection upon startup. This script checks for an internet connection and once established, it updates the repositories. By default, the script checks for an internet connection for a maximum of 2 minutes. This value can be adjusted in line 8.

You just need to execute the script using `cron` after the startup process.

I primarily use it for my private blog, which runs on [Hugo CMS](https://gohugo.io/) and is versioned in Git.

Feel free to use and modify this script as needed.

