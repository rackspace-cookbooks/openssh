openssh Cookbook CHANGELOG
==========================
This file is used to list changes made in each version of the openssh cookbook.

v3.1.1
------
- Fix template syntax error for [Issue #4](https://github.com/rackspace-cookbooks/rackspace_openssh/issues/4)

v3.1.0
------
- Sets "PermitRootLogin" to default to "No"
- Update to latest Gemfile, Rakefile and rubocop config
- Remove logic from attributes for non-supported OS's
- Fix rubocop to count the template tests in coverage report

v3.0.0
------
### Improvement
- Improve configuration key naming
- Add common default attributes
  - WARNING: This change will set the HostKey attribute by default, possibly changing your server fingerprint.  See [Issue #5](https://github.com/rackspace-cookbooks/rackspace_openssh/issues/5)

v2.0.0
------
### Improvement
Rackspace rework

v1.3.0
------
### Improvement
- **[COOK-3644](https://tickets.opscode.com/browse/COOK-3644)** - Add FreeBSD support
- **[COOK-2517](https://tickets.opscode.com/browse/COOK-2517)** - Add hash support
- **[COOK-2000](https://tickets.opscode.com/browse/COOK-2000)** - Make mode of sshd_config a configurable option

### Bug
- **[COOK-3558](https://tickets.opscode.com/browse/COOK-3558)** - Fix RSA Server Config Options
- **[COOK-3557](https://tickets.opscode.com/browse/COOK-3557)** - Fix PubkeyAuthentication option


v1.2.2
------
### Bug
- **[COOK-3304](https://tickets.opscode.com/browse/COOK-3304)** - Fix error setting Dynamic `ListenAddresses`

v1.2.0
------
### Improvement
- [COOK-2647]: `port_ssh` iptables template has no corresponding recipe

v1.1.4
------
- [COOK-2225] - Add platform_family suse

v1.1.2
------
- [COOK-1954] - Fix attribute camel case to match `man sshd_config`
- [COOK-1889] - SSH restarting on each chef run due to template changes

v1.1.0
------
- [COOK-1663] - Configurable ListenAddress based off list of interface names
- [COOK-1685] - Make default sshd_config value more robust

v1.0.0
------
- [COOK-1014] - Templates for ssh(d).conf files.

v0.8.1
------
- Current public release
