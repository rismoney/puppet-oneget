# authored by Rich Siegel (rismoney@gmail.com)
# with help from some of the other pkg providers of course

require 'puppet/provider/package'

Puppet::Type.type(:package).provide(:oneget, :parent => Puppet::Provider::Package) do
  desc "Package management using oneget on Windows"
  confine    :operatingsystem => :windows

  has_feature :installable, :uninstallable, :upgradeable, :versionable, :install_options


  def install
  end

  def uninstall
  end

  def update
  end

  # from puppet-dev mailing list
  # Puppet will call the query method on the instance of the package
  # provider resource when checking if the package is installed already or
  # not.
  # It's a determination for one specific package, the package modeled by
  # the resource the method is called on.
  # Query provides the information for the single package identified by @Resource[:name].

  def query
  end

  def self.listcmd
  end

  def self.instances
  end

  def latestcmd
  end

  def latest
  end

end
