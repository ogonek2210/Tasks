# Exadel-DevOps
1. You need to make sure that your system is open to receiving SSH connections automatically, so you should use the following command as root or with sudo:
**sudo systemctl enable ssh**. Running this command tells your system to start the SSH service every time the computer boots up.

2. If you are still having connection issues after verifying that the SSH service is up and running, perhaps the SSH connection is being blocked before it even has a chance to reach the system – like on your router. You should use the following command: **grep Port /etc/ssh/sshd_config**

3. Another thing to check is your operating system’s firewall, so you should use this command to allow incoming SSH connections: **sudo iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT**. If you are running firewalld and need to allow SSH connections, use this command: **$ firewall-cmd --zone=public --add-service=ssh**

4. If your system has a duplicate IP address on the network, SSH (and other services that depend on your network) are likely to have trouble functioning properly. This is always a good thing to check for, and it’s pretty simple to do with the host command **$ host x.x.x.x**. The host command returns with information about the IP address we just passed to it. Use the hostname to determine that you are indeed trying to reach the correct system.

