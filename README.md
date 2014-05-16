puppet-oneget
=============

** Member of the rismoney suite of Windows Puppet Providers **

puppet provider for Microsoft Oneget

What is OneGet?

OneGet is a unified interface to package management systems and aims to make Software Discovery, Installation and Inventory (SDII) work via a common set of cmdlets (and eventually a set of APIs). Regardless of the installation technology underneath, users can use these common cmdlets to install/uninstall packages, add/remove/query package repositories, and query a system for the software installed. Included in this CTP is a prototype implementation of a Chocolatey-compatible package manager that can install existing Chocolatey packages.

What is Puppet? Puppet is IT automation software that helps system administrators manage infrastructure throughout its lifecycle, from provisioning and configuration to patch management and compliance. Using Puppet, you can easily automate repetitive tasks, quickly deploy critical applications, and proactively manage change, scaling from 10s of servers to 1000s, on-premise or in the cloud.

What is puppet-oneget?
Lets you use Oneget with Puppet as a package provider.

Status:
This is now in beta and supports ensure => present, absent and version only.
Will not yet perform upgrades or latest.  This is pending.
Other needed pieces: unit tests (rspec)
