require 'spec_helper'

describe 'rackspace_openssh::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs the openssh packages' do
    expect(chef_run).to install_package('openssh-client')
    expect(chef_run).to install_package('openssh-server')
  end

  it 'starts the ssh service' do
    expect(chef_run).to start_service('ssh')
    expect(chef_run).to enable_service('ssh')
  end

  it 'writes the ssh_config' do
    expect(chef_run).to create_template('/etc/ssh/ssh_config').with(
      user: 'root',
      group: 'root',
      mode: '0644'
    )
  end

  it 'writes the ssh_config' do
    expect(chef_run).to create_template('/etc/ssh/sshd_config').with(
      user: 'root',
      group: 'root',
      mode: '0644'
    )
  end

  it 'has expected sshd_config settings' do
    expect(chef_run).to render_file('/etc/ssh/sshd_config').with_content('LogLevel VERBOSE')
  end
end
