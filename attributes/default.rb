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
default['rackspace_openssh']['config']['server']['authorized_keys_file'] = '%h/.ssh/authorized_keys'
default['rackspace_openssh']['config']['server']['challenge_response_authentication'] = 'no'
default['rackspace_openssh']['config']['server']['use_p_a_m'] = 'yes'

# Other common sshd options
# default['rackspace_openssh']['config']['server']['port'] = '22'
# default['rackspace_openssh']['config']['server']['address_family'] = 'any'
# default['rackspace_openssh']['config']['server']['listen_address'] = [ '0.0.0.0 ::' ']
# default['rackspace_openssh']['config']['server']['protocol'] = '2'
# default['rackspace_openssh']['config']['server']['host_key_v1'] = '/etc/ssh/ssh_host_key'
# default['rackspace_openssh']['config']['server']['host_key_rsa'] = '/etc/ssh/ssh_host_rsa_key'
# default['rackspace_openssh']['config']['server']['host_key_dsa'] = '/etc/ssh/ssh_host_dsa_key'
# default['rackspace_openssh']['config']['server']['host_key_ecdsa'] = '/etc/ssh/ssh_host_ecdsa_key'
# default['rackspace_openssh']['config']['server']['key_regeneration_interval'] = '1h'
# default['rackspace_openssh']['config']['server']['server_key_bits'] = '1024'
# default['rackspace_openssh']['config']['server']['syslog_facility'] = 'AUTH'
# default['rackspace_openssh']['config']['server']['log_level'] = 'INFO'
# default['rackspace_openssh']['config']['server']['login_grace_time'] = '2m'
# default['rackspace_openssh']['config']['server']['permit_root_login'] = 'yes'
# default['rackspace_openssh']['config']['server']['strict_modes'] = 'yes'
# default['rackspace_openssh']['config']['server']['max_auth_tries'] = '6'
# default['rackspace_openssh']['config']['server']['max_sessions'] = '10'
# default['rackspace_openssh']['config']['server']['r_s_a_authentication'] = 'yes'
# default['rackspace_openssh']['config']['server']['pubkey_authentication'] = 'yes'
# default['rackspace_openssh']['config']['server']['rhosts_r_s_a_authentication'] = 'no'
# default['rackspace_openssh']['config']['server']['host_based_authentication'] = 'no'
# default['rackspace_openssh']['config']['server']['ignore_user_known_hosts'] = 'no'
# default['rackspace_openssh']['config']['server']['ignore_rhosts'] = 'yes'
# default['rackspace_openssh']['config']['server']['password_authentication'] = 'yes'
# default['rackspace_openssh']['config']['server']['permit_empty_passwords'] = 'no'
# default['rackspace_openssh']['config']['server']['kerberos_authentication'] = 'no'
# default['rackspace_openssh']['config']['server']['kerberos_or_localpasswd'] = 'yes'
# default['rackspace_openssh']['config']['server']['kerberos_ticket_cleanup'] = 'yes'
# default['rackspace_openssh']['config']['server']['kerberos_get_afs_token'] = 'no'
# default['rackspace_openssh']['config']['server']['gssapi_authentication'] = 'no'
# default['rackspace_openssh']['config']['server']['gssapi_clean_up_credentials'] = 'yes'
# default['rackspace_openssh']['config']['server']['allow_agent_forwarding'] = 'yes'
# default['rackspace_openssh']['config']['server']['allow_tcp_forwarding'] = 'yes'
# default['rackspace_openssh']['config']['server']['gateway_ports'] = 'no'
# default['rackspace_openssh']['config']['server']['x11_forwarding'] = 'no'
# default['rackspace_openssh']['config']['server']['x11_display_offset'] = '10'
# default['rackspace_openssh']['config']['server']['x11_use_localhost'] = 'yes'
# default['rackspace_openssh']['config']['server']['print_motd'] = 'yes'
# default['rackspace_openssh']['config']['server']['print_lastlog'] = 'yes'
# default['rackspace_openssh']['config']['server']['t_c_p_keep_alive'] = 'yes'
# default['rackspace_openssh']['config']['server']['use_login'] = 'no'
# default['rackspace_openssh']['config']['server']['use_privilege_separation'] = 'yes'
# default['rackspace_openssh']['config']['server']['permit_user_environment'] = 'no'
# default['rackspace_openssh']['config']['server']['compression'] = 'delayed'
# default['rackspace_openssh']['config']['server']['client_alive_interval'] = '0'
# default['rackspace_openssh']['config']['server']['client_alive_count_max'] = '3'
# default['rackspace_openssh']['config']['server']['use_dns'] = 'yes'
# default['rackspace_openssh']['config']['server']['pid_file'] = '/var/run/sshd.pid'
# default['rackspace_openssh']['config']['server']['max_startups'] = '10'
# default['rackspace_openssh']['config']['server']['permit_tunnel'] = 'no'
# default['rackspace_openssh']['config']['server']['chroot_directory'] = 'none'
# default['rackspace_openssh']['config']['server']['banner'] = 'none'
# default['rackspace_openssh']['config']['server']['subsystem'] =	'sftp	/usr/libexec/sftp-server'
