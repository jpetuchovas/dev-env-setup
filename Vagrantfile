Vagrant.configure('2') do |config|
  config.vm.box = 'peru/ubuntu-18.04-desktop-amd64'
  config.vm.synced_folder '.', '/vagrant', type: 'nfs'
  config.vm.network 'private_network', type: 'dhcp'

  config.vm.provider 'virtualbox' do |virtualbox|
    virtualbox.gui = true
    virtualbox.name = 'ubuntu'
    virtualbox.memory = 4096
    virtualbox.cpus = 2
    virtualbox.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    virtualbox.customize ['modifyvm', :id, '--vram', '128']
  end

  config.vm.provision 'ansible_local' do |ansible|
    ansible.limit = 'all,localhost'
    ansible.playbook = 'local.yml'
  end
end
