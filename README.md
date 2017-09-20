# warden
Dirty Bash Wrapper Around Apt And Docker Prune

**DO NOT USE ON PRODUCTION SETUPS**

A *dirty wrapper* around ``apt`` and ``docker`` commands.

**Be aware** This script will remove **all** unused Docker Volumes, Docker Images, Docker Networks and so on.

**Be sure that you know what you are doing! **

## What is does

Not much, it runs:

* ``apt-get autoremove``
* ``docker system prune --all --force``

This script is used as *cleanup* step on a somewhat small and power (as in hardware and disk space)lacking sandbox, before ``apt updgrade``.

There is the possiblity that I will combine all these steps into one
proper *update script* in the future.
