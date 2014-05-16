#class rich::packages {
  $pkg = 'notepadplusplus'

  package { $pkg:
    ensure          => 'present',
    provider        => 'oneget',
 
  }
#}
