Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'

  config.vm.provider 'virtualbox' do |vb|
    vb.gui = true
    vb.memory = '4096'
    vb.name = 'ubuntu'
  end

  config.vm.provision 'ansible_local' do |ansible|
    ansible.install_mode = 'pip'
    ansible.limit = 'all,localhost'
    ansible.playbook = 'local.yml'
  end
end
