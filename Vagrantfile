# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

NUM_WORKERS = 1

V4_PRIVATE_NETWORK_PREFIX = '192.168.78.'
V4_PUBLIC_NETWORK_PREFIX = '192.168.77.'

MEMORY = 8292

ENV['VAGRANT_NO_PARALLEL'] = 'yes'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false
  config.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key']

  config.vm.box = 'generic/ubuntu2004'
  config.vm.provider :libvirt do |v|
    v.memory  = MEMORY
    v.nested  = true
    v.cpus    = 2
  end

  config.vm.define 'master' do |node|
    node.vm.hostname = 'master'
    node.vm.network 'private_network', ip: V4_PUBLIC_NETWORK_PREFIX + '100'
    node.vm.network 'private_network', ip: V4_PRIVATE_NETWORK_PREFIX + '100'
  end

  # Kubernetes Worker Nodes
  NodeCount = 2
  (1..NodeCount).each do |node_id|
    config.vm.define "worker#{node_id}" do |node|
      node.vm.hostname = "worker#{node_id}"
      node.vm.network 'private_network', ip: V4_PUBLIC_NETWORK_PREFIX + (100 + node_id).to_s
      node.vm.network 'private_network', ip: V4_PRIVATE_NETWORK_PREFIX + (100 + node_id).to_s
    end
  end
end
