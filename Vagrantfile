# -*- mode: ruby -*-
# vi: set ft=ruby :

'''
/**
 * containerize
 *
 * Vagrantfile for Linux Containers (Operating System Level Virtualization)
 * as Docker, Mesos DC/OS etc.
 * @author Adriano Vieira <adriano.svieira at gmail.com>

   Copyright 2016 Adriano dos Santos Vieira

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 * @license @see LICENCE
 */
 '''

VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.7.2"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version. Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  #May be you could use one of my "boxes" <https://atlas.hashicorp.com/adrianovieira/boxes>
  #config.vm.box = "adrianovieira/boxes/centos7-kernel4.4-vbox5.0-docker1.12GA"
  config.vm.box = "adrianovieira/centos7-docker1.12-GA"
  config.vm.box_check_update = false
  config.vm.hostname = "containerize-host"

  # folder to mount on VM host
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080 #, auto_correct: true
  #config.vm.network "forwarded_port", guest: 80, host: 1080 #, auto_correct: true
  #config.vm.network "forwarded_port", guest: 443, host: 1443 #, auto_correct: true
  #config.vm.network "forwarded_port", guest: 5000, host: 5000 #, auto_correct: true
  #config.vm.network "forwarded_port", guest: 8080, host: 8080 #, auto_correct: true
  #config.vm.network "forwarded_port", guest: 8443, host: 8443 #, auto_correct: true

  #config.vm.network "private_network", ip: "10.2.2.2"
  #config.vm.network "public_network", bridge: ["en1: Wi-Fi (AirPort)", "en0: Ethernet", "<what>"]

  config.vm.provider "virtualbox" do |virtualbox| # Virtualbox.settings
    #   virtualbox.gui = true
    virtualbox.customize [ "modifyvm", :id, "--cpus", 2 ]
    virtualbox.customize [ "modifyvm", :id, "--memory", 20248 ]
    virtualbox.customize [ "modifyvm", :id, "--name", "containerize-host" ]
    virtualbox.customize [ "modifyvm", :id, "--groups", "/containerize" ]
  end # end Virtualbox.settings

end
