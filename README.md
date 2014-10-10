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
The v2.0 (20141010) update includes the following changes:
  1. Changed algorithms
    * Short is now MD5
    * Long is now SHA256
  2. New Languages
    * Python
    * PHP
  3. GUI
    *  GUI based on Python version and wxPython
