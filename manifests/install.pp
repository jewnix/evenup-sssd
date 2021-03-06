# == Class: sssd::install
#
# This class installs sssd.  It is not intended to be called directly.
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class sssd::install (
) {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  package { 'sssd':
    ensure => 'latest',
  }

  package { 'sssd-client':
    ensure => 'latest',
  }

  if versioncmp($::operatingsystemmajrelease, '6') >= 0 {
    package { 'pam_ldap':
      ensure => 'installed',
    }
   }

  if versioncmp($::operatingsystemrelease, '7.0') >= 0 {
    package { 'oddjob-mkhomedir':
      ensure => 'installed',
    }
  }

}
