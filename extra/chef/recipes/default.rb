# fix source
bash :fix_source do
  code <<-EOH
    rm /bin/sh && ln -s /bin/bash /bin/sh
  EOH
end

# Install Ubuntu dependencies
bash :set_dependencies do
  code <<-EOH
    sudo apt-get update && \
    sudo apt-get install openssh-server  && \
    sudo sed -i 's/X11Forwarding no/X11Forwarding yes/' /etc/ssh/sshd_config && \
    /etc/init.d/ssh restart && \
    sudo apt-get install docker.io && \
    update-rc.d docker.io defaults && \
    docker pull fiware/docker-trustworthyfactory
  EOH
end