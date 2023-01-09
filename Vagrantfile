# Grab the name of the default interface
$default_network_interface = `ip route | awk '/^default/ {printf "%s", $5; exit 0}'`

# IP Address configuration
$vm1_ip = '192.168.56.11'
$ansible_ip = '192.168.56.30'

Vagrant.configure("2") do |config|
    
    config.vm.define "vm1" do |n1|
      n1.vm.box = "ubuntu/bionic64"
      n1.vm.provider "virtualbox" do |vb|
        vb.memory = 512
        vb.cpus = 1
        vb.name = "vm1"
      end
      n1.vm.hostname = "vm1"
      n1.vm.network "public_network", bridge: $default_network_interface
      n1.vm.network "private_network", ip: $vm1_ip
      n1.vm.synced_folder ".", "/vagrant", disabled: true
      n1.vm.synced_folder "./config", "/configs"
      n1.vm.synced_folder "./keys", "/keys"
      n1.vm.provision "shell",
          inline: "apt-get update"
      n1.vm.provision 'shell', inline: "cat /keys/ansible-id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
    end

    config.vm.define "ansible" do |ansible|
      ansible.vm.box = "ubuntu/bionic64"
      ansible.vm.provider "virtualbox" do |vb|
        vb.memory = 512
        vb.cpus = 1
        vb.name = "ansible"
      end

      ansible.vm.hostname = "ansible"
      #Network bridge configuration
      ansible.vm.network "public_network", bridge: "#$default_network_interface"
      ansible.vm.network "private_network", ip: $ansible_ip

      ansible.vm.provision "shell",
          inline: "apt-get update && \
                   apt-get install -y software-properties-common && \
                   apt-add-repository --yes ppa:ansible/ansible && \
		               apt-get update && \
                   apt-get install -y ansible"
  
      #Shared folder (host) configuration
      ansible.vm.synced_folder "./config", "/configs"
      ansible.vm.synced_folder "./keys", "/keys"

      #Public ssh key configuration
      ansible.vm.provision 'shell', inline: "cat /keys/ansible-id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"

      #Private ssh key configuration
      ansible.vm.provision 'shell', inline: "cp /keys/ansible-id_rsa /home/vagrant/.ssh/id_rsa && \
      chmod 600 /home/vagrant/.ssh/id_rsa && chown vagrant:vagrant /home/vagrant/.ssh/id_rsa"

      ansible.vm.provision 'shell', inline: "ansible-galaxy collection install ansible.posix"

      #Integrating ansible <-> vagrant
      ansible.vm.provision "shell", inline: "ansible-playbook -i /configs/hosts \
        /configs/provisioning.yml"

      end
end


