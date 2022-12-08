# Description
### Systemd unit files to allow your user services to run inside a network namespace.
It's not a perfect solution, and I haven't done very extensive testing beyond "It works for me and doesn't break in these few situations I can imagine happening" but since I had to make this solution for myself, I figured I'd put it out there and maybe help someone else.

If you encounter any issues, let me know and I'd be happy to help and try to fix it, I just have no motivation to go looking for bugs that may not exist, or that I have no idea could exist, especially when I don't have a good testing environment that is even remotely enjoyable to try and work in.

# Usage
### 1) Place unit files in relevant directory
I'm not well versed in Linux, or the diverse configurations, however, my systemd unit files lived in `/etc/systemd/system`.

### 2) Edit `netns-prepare@NAME.service` to include required variables
`netns-prepare@.service` requires that some variables be set. These variables need to change for each new namespace you want to use. In my Debian 11 install, I acomplished this by using the command `systemctl edit netns-prepare@NAME.service` where NAME is the name of namespace. In `example.service` you can see that the name I am using is "qbit".

### 3) Create or modify your own unit file to run something inside the namespace.
`example.service` is a an exact copy, plus some comments, of the service I use on my system. I am not confident enough in my knowledge of systemd to attempt to explain how to make your own for your specific situation so I am choosing to teach through a single example, apologies.

# Some third heading, idk
Again though, I'm not well versed in Linux distros or their numerous configuration options, nor do I really understand systemd all that well. If there are any bugs or difficulty using this, or even if the documentation isn't clear enough, please don't hesitate to let me know as it is honestly a great learning opportunity for me. Hope this helps!