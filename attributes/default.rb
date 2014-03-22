#
# Cookbook Name:: rackspace_openssh
# Attributes:: default
#
# Author:: Ernie Brodeur <ebrodeur@ujami.net>
# Copyright 2008-2013, Opscode, Inc.
# Copyright 2014, Rackspace, US Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Attributes are commented out using the default config file values.
# Uncomment the ones you need, or set attributes in a role.
#

default['rackspace_openssh']['templates_cookbook']['ssh_config'] = 'rackspace_openssh'
default['rackspace_openssh']['templates_cookbook']['sshd_config'] = 'rackspace_openssh'

default['rackspace_openssh']['config']['package_name'] = case node['platform_family']
                                                         when 'rhel', 'fedora'
                                                           %w[openssh-clients openssh]
                                                         when 'arch', 'suse'
                                                           %w[openssh]
                                                         when 'freebsd'
                                                           %w[']
                                                         else
                                                           %w[openssh-client openssh-server]
                                                         end

default['rackspace_openssh']['config']['service_name'] = case node['platform_family']
                                                         when 'rhel', 'fedora', 'suse', 'freebsd'
                                                           'sshd'
                                                         else
                                                           'ssh'
                                                         end

default['rackspace_openssh']['config']['config_mode'] = case node['platform_family']
                                                        when 'rhel', 'fedora'
                                                          '0600'
                                                        else
                                                          '0644'
                                                        end

default['rackspace_openssh']['config']['rootgroup']    = case node['platform_family']
                                                         when 'freebsd'
                                                           'wheel'
                                                         else
                                                           'root'
                                                         end

# ssh config group
default['rackspace_openssh']['config']['client']['host'] = '*'
# default['rackspace_openssh']['config']['client']['forward_agent'] = 'no'
# default['rackspace_openssh']['config']['client']['forward_x11'] = 'no'
# default['rackspace_openssh']['config']['client']['rhosts_rsa_authentication'] = 'no'
# default['rackspace_openssh']['config']['client']['rsa_authentication'] = 'yes'
# default['rackspace_openssh']['config']['client']['password_authentication'] = 'yes'
# default['rackspace_openssh']['config']['client']['host_based_authentication'] = 'no'
# default['rackspace_openssh']['config']['client']['gssapi_authentication'] = 'no'
# default['rackspace_openssh']['config']['client']['gssapi_delegate_credentials'] = 'no'
# default['rackspace_openssh']['config']['client']['batch_mode'] = 'no'
# default['rackspace_openssh']['config']['client']['check_host_ip'] = 'yes'
# default['rackspace_openssh']['config']['client']['address_family'] = 'any'
# default['rackspace_openssh']['config']['client']['connect_timeout'] = '0'
# default['rackspace_openssh']['config']['client']['strict_host_key_checking'] = 'ask'
# default['rackspace_openssh']['config']['client']['identity_file'] = '~/.ssh/identity'
# default['rackspace_openssh']['config']['client']['identity_file_rsa'] = '~/.ssh/id_rsa'
# default['rackspace_openssh']['config']['client']['identity_file_dsa'] = '~/.ssh/id_dsa'
# default['rackspace_openssh']['config']['client']['port'] = '22'
# default['rackspace_openssh']['config']['client']['protocol'] = [ '2 1' ']
# default['rackspace_openssh']['config']['client']['cipher'] = '3des'
# default['rackspace_openssh']['config']['client']['ciphers'] = [ 'aes128-ctr aes192-ctr aes256-ctr arcfour256 arcfour128 aes128-cbc 3des-cbc' ']
# default['rackspace_openssh']['config']['client']['macs'] = [ 'hmac-md5 hmac-sha1 umac-64@openssh.com hmac-ripemd160' ']
# default['rackspace_openssh']['config']['client']['escape_char'] = '~'
# default['rackspace_openssh']['config']['client']['tunnel'] = 'no'
# default['rackspace_openssh']['config']['client']['tunnel_device'] = 'any:any'
# default['rackspace_openssh']['config']['client']['permit_local_command'] = 'no'
# default['rackspace_openssh']['config']['client']['visual_host_key'] = 'no'
# default['rackspace_openssh']['config']['client']['proxy_command'] = 'ssh -q -W %h:%p gateway.example.com'


# sshd config group
# set verbose loggin above default precedence
normal['rackspace_openssh']['config']['server']['LogLevel'] = 'VERBOSE'

default['rackspace_openssh']['config']['server']['Port'] = '22'
default['rackspace_openssh']['config']['server']['Protocol'] = '2'
default['rackspace_openssh']['config']['server']['HostKey'] = '/etc/ssh/ssh_host_rsa_key'
default['rackspace_openssh']['config']['server']['HostKey'] = '/etc/ssh/ssh_host_dsa_key'
default['rackspace_openssh']['config']['server']['HostKey'] = '/etc/ssh/ssh_host_ecdsa_key'
default['rackspace_openssh']['config']['server']['ChallengeResponseAuthentication'] = 'no'
default['rackspace_openssh']['config']['server']['KeyRegenerationInterval'] = '1h'
default['rackspace_openssh']['config']['server']['ServerKeyBits'] = '1024'
default['rackspace_openssh']['config']['server']['SyslogFacility'] = 'AUTH'
default['rackspace_openssh']['config']['server']['LoginGraceTime'] = '2m'
default['rackspace_openssh']['config']['server']['PermitRootLogin'] = 'yes'
default['rackspace_openssh']['config']['server']['StrictModes'] = 'yes'
default['rackspace_openssh']['config']['server']['MaxAuthTries'] = '6'
default['rackspace_openssh']['config']['server']['RSAAuthentication'] = 'yes'
default['rackspace_openssh']['config']['server']['PubkeyAuthentication'] = 'yes'
default['rackspace_openssh']['config']['server']['AuthorizedKeysFile'] = '%h/.ssh/authorized_keys'
default['rackspace_openssh']['config']['server']['IgnoreRhosts'] = 'yes'
default['rackspace_openssh']['config']['server']['HostBasedAuthentication'] = 'no'
default['rackspace_openssh']['config']['server']['PermitEmptyPasswords'] = 'no'
default['rackspace_openssh']['config']['server']['PasswordAuthentication'] = 'yes'
default['rackspace_openssh']['config']['server']['ChallengeResponseAuthentication'] = 'no'
default['rackspace_openssh']['config']['server']['GSSAPICleanUpCredentials'] = 'yes'
default['rackspace_openssh']['config']['server']['X11Forwarding'] = 'no'
default['rackspace_openssh']['config']['server']['PrintLastlog'] = 'yes'
default['rackspace_openssh']['config']['server']['TCPKeepAlive'] = 'yes'
default['rackspace_openssh']['config']['server']['TCPKeepAlive'] = 'AcceptEnv LANG LC_* XMODIFIERS'
default['rackspace_openssh']['config']['server']['Subsystem'] = case node['platform_family']
                                                                when 'rhel'
                                                                  'sftp /usr/libexec/sftp-server'
                                                                else
                                                                  'sftp /usr/lib/openssh/sftp-server'
                                                                end
default['rackspace_openssh']['config']['server']['UsePAM'] = 'yes'

# Other common sshd options
# default['rackspace_openssh']['config']['server']['AddressFamily'] = 'any'
# default['rackspace_openssh']['config']['server']['ListenAddress'] = [ '0.0.0.0 ::' ']
# default['rackspace_openssh']['config']['server']['HostKeyV1'] = '/etc/ssh/ssh_host_key'
# default['rackspace_openssh']['config']['server']['MaxSessions'] = '10'
# default['rackspace_openssh']['config']['server']['RhostsRSAAuthentication'] = 'no'
# default['rackspace_openssh']['config']['server']['IgnoreUserKnownHosts'] = 'no'
# default['rackspace_openssh']['config']['server']['KerberosAuthentication'] = 'no'
# default['rackspace_openssh']['config']['server']['KerberosOrLocalpasswd'] = 'yes'
# default['rackspace_openssh']['config']['server']['KerberosTicketCleanup'] = 'yes'
# default['rackspace_openssh']['config']['server']['KerberosGetAfsToken'] = 'no'
# default['rackspace_openssh']['config']['server']['GSSAPIAuthentication'] = 'no'
# default['rackspace_openssh']['config']['server']['AllowAgent_forwarding'] = 'yes'
# default['rackspace_openssh']['config']['server']['AllowTcpForwarding'] = 'yes'
# default['rackspace_openssh']['config']['server']['GatewayPorts'] = 'no'
# default['rackspace_openssh']['config']['server']['X11DisplayOffset'] = '10'
# default['rackspace_openssh']['config']['server']['X11UseLocalhost'] = 'yes'
# default['rackspace_openssh']['config']['server']['PrintMotd'] = 'yes'
# default['rackspace_openssh']['config']['server']['UseLogin'] = 'no'
# default['rackspace_openssh']['config']['server']['UsePrivilegeSeparation'] = 'yes'
# default['rackspace_openssh']['config']['server']['PermitUserEnvironment'] = 'no'
# default['rackspace_openssh']['config']['server']['Compression'] = 'delayed'
# default['rackspace_openssh']['config']['server']['ClientAliveInterval'] = '0'
# default['rackspace_openssh']['config']['server']['ClientAliveCountMax'] = '3'
# default['rackspace_openssh']['config']['server']['UseDns'] = 'yes'
# default['rackspace_openssh']['config']['server']['PidFile'] = '/var/run/sshd.pid'
# default['rackspace_openssh']['config']['server']['MaxStartups'] = '10'
# default['rackspace_openssh']['config']['server']['PermitTunnel'] = 'no'
# default['rackspace_openssh']['config']['server']['ChrootDirectory'] = 'none'
# default['rackspace_openssh']['config']['server']['Banner'] = 'none'
