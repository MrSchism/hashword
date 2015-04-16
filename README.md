hashword
========

Scripts used to hash a given password before using it on a server to increase password complexity.

The basic principle is to give a user a local place to input a known password.  That password is hashed, resulting in either a short (MD5) or long (sha256) secure password.

Improvements
------------

Intended improvements are as follows:

1. Add optional out to clipboard for easy copy-paste
2. Create a version in ~~python~~, java, ~~and PHP~~
3. ~~GUI.  It's going to happen.~~


Updates
-------
20150416-
Beginning with the PowerShell hashword checker the v3-dev branch will be worked on; v2-archive exists solely to archive the previous version.

The v3 branch will include:
  1. Add complexity
    * Legacy mode to provide backwards compatibility.
  2. Improved GUI
  3. Improved Web build (possibly in JavaScript to prevent page update)
  4. Basic implementation for Android app

The v2.0 (20141010) update includes the following changes:
  1. Changed algorithms
    * Short is now MD5
    * Long is now SHA256
  2. New Languages
    * Python
    * PHP
  3. GUI
    *  GUI based on Python version and wxPython
