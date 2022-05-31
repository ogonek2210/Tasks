Task #1
1. **Error #1 - Hostname Resolution** (most resolution errors occur when the reference to the SSH host can’t be mapped to a network address. While this is almost exclusively DNS related, the root cause isn’t always a DNS issue): 
   - verify the hostname is properly spelled. Typographical errors can strike at any time;
   - verify that you can resolve the hostname on your client machine using the system ping command. Using third-party sites like WhatsMyDns.net to check beyond your own DNS caching can also help confirm the results.

2. **Error #2 - Connection Timeout** (it means that the client attempted to establish a network socket to the SSH server, but the server failed to respond within the timeout period): 
    - verify that the host IP address is correct;
    - verify that your network supports connectivity over the SSH port being used;
    - verify the firewall rules.
3. **Error #3 - Connection Refused** (a connection being refused has some subtle differences from a timeout. This means that the request is being routed to the SSH host, but the host does not successfully accept the request):
    - verify that the host IP address is correct;
    - verify that your network supports connectivity over the SSH port being used. Some public networks may block port 22 or custom SSH ports;
    - verify the firewall rules;
    - verify that the service is currently running and bound to the expected port.

**Solutions**

*-Checking Your Firewall-*

Some connectivity problems can be caused by firewall configurations. If your firewall is set up to block certain ports or services, it can prevent you from connecting. 

If you add a firewall rule that allows your local machine to connect by IP address, verify that the IP address assigned by your ISP has not changed. If it has, then you need to modify that firewall rule to permit the new IP address or address range, so you should use the following command: 

**iptables -nL**

*-Checking the SSH Service Status-*

You should check that the SSH service is running, so you should use the following command:

**systemctl status sshd**

*-Checking the SSH Service Port-*

There are two general ways to check which port the SSH service is running on. One is checking the SSH configuration file, and the other is examining the running process.

On most systems, the SSH configuration file is **/etc/ssh/sshd_config**. The default port is 22, but can be overridden by any configuration line in this file specifying a Port directive with a number.

You can search lines like this using grep:

**grep Port /etc/ssh/sshd_config**

If you know the service is running, you can confirm that the service is running on the expected port using ss (run with sudo or as the root user). Similar output is provided for the netstat -plnt command as well, but ss is the preferred command for querying socket information from the kernel.

**ss -plnt**
