Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'

  config.vm.provider 'virtualbox' do |virtual_box|
    virtual_box.gui = true
    virtual_box.name = 'ubuntu'
    virtual_box.memory = 4096
    virtual_box.cpus = 2
    virtual_box.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
  end

  config.vm.provision 'ansible_local' do |ansible|
    ansible.install_mode = 'pip'
    ansible.limit = 'all,localhost'
    ansible.playbook = 'local.yml'
  end
end
