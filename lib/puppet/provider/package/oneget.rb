# authored by Rich Siegel (rismoney@gmail.com)
require 'puppet/provider/package'

Puppet::Type.type(:package).provide(:oneget, :parent => Puppet::Provider::Package) do
  desc "Package management using oneget on Windows"
  confine    :operatingsystem => :windows

  has_feature :installable, :uninstallable, :upgradeable, :versionable

  commands :poshexec =>
    if File.exists?("#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe")
      "#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe"
    elsif File.exists?("#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe")
      "#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe"
    else
      'powershell.exe'
    end

  @@connstr= "import-module OneGet"
 
 def print()
   notice("The value is: '${name}'")
 end

  
  def install
    should = @resource.should(:ensure)
    case should
    when true, false, Symbol
      args = "Install-Package", @resource[:name], resource[:install_options], "-Force"
    else
      # Add the package version
      args = "Install-Package", @resource[:name], "-RequiredVersion", resource[:ensure], resource[:install_options], '-Force'
    end

    if @resource[:source]
      args << "-source" << resource[:source]
    end

    poshexec(*args)
  end

  def uninstall
    args = "Uninstall-Package", @resource[:name]
    poshexec(*args)
  end

  def update
    #not here yet
  end

  def query
    self.class.instances.each do |provider|
      if provider.name == @resource.name
        return provider.properties
      end
    end
    nil
  end

  def self.listcmd
    args = ' get-Package ^|select-object name,version ^| % { \"{0} {1}\" -f $_.Name, $_.Version}' 
    [command(:poshexec), args]
  end

 def self.instances
    packages = []

    begin
      execpipe(listcmd()) do |process|
        process.each_line do |line|
          line.chomp!
          if line.empty? ; next; end
          values = line.split(' ')
          packages << new({ :name => values[0], :ensure => values[1], :provider => self.name })
        end
      end
    rescue Puppet::ExecutionFailure
      return nil
    end
    packages
  end
  
  def latestcmd
    # not yet supported
  end

  def latest
    #not yet supported
  end

end
