hashword
========

Scripts used to hash a given password before using it on a server to increase password length.

The basic principle is to give a user a local place to input a known password.  That password is hashed, resulting in either a short (sha256) or long (sha512) secure password.

Improvements
------------

Intended improvements are as follows:

1. Add optional out to clipboard for easy copy-paste
2. Append an octothorp to the beginning of the hash, thus adding a special character to the passwords
3. Create a version in ruby, python, and java
