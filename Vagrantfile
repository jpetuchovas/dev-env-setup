Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'

  config.vm.provider 'virtualbox' do |virtualbox|
    virtualbox.gui = true
    virtualbox.name = 'ubuntu'
    virtualbox.memory = 4096
    virtualbox.cpus = 2
    virtualbox.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    virtualbox.customize ['modifyvm', :id, '--vram', '128']
  end

  config.vm.provision 'ansible_local' do |ansible|
    ansible.install_mode = 'pip'
    ansible.limit = 'all,localhost'
    ansible.playbook = 'local.yml'
  end
end
