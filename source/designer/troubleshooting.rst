Troubleshooting
===============

User limit of inotify instances reached (Linux)
-----------------------------------------------
On Linux, if you open a workspace with many projects, the engine sometimes reports the following error:

:code:`Error: <...> User limit of inotify instances reached or too many open files`

Solution: Increase the maximum number of inotify instances manually:

:code:`sudo sysctl fs.inotify.max_user_instances=512`
