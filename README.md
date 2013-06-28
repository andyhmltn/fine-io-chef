fine-io-chef
============

This is the chef solo file for provisioning a new dedicated server/vps server using the Fine.IO stack.

What does it do?
===========

It currently installs:
  * nginx
  * redis

It also creates the following users:
  * deployer

The final thing it will do is modify vital files such as the hosts file to add any relevent information to them.

What will it do?
============
Hopefully, when I get time I'll get it installing the following:
  * Node.JS
  * Ruby via RVM
  * MySQL
  * SQLite
  * MongoDB

