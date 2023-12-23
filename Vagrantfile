Vagrant.configure("2") do |srv|
 srv.vm.box = "centos/7"

 srv.vm.provider "virtualbox" do |i|
  i.name = "vm_server1"
  i.memory = "2048"
  i.cpus = 2
 end
 srv.vm.provision :file, source: './access.log', destination: '/home/vagrant/logs/'
 srv.vm.provision :file, source: './scripts/', destination: '/home/vagrant/'
 srv.vm.provision "shell", inline: <<-SHELL
         yum install -y mailx
      SHELL
srv.vm.synced_folder '.', '/vagrant', disabled: true
end
