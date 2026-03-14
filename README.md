# goal is only edu purpose and kiss runned k3s. I wanna try add additional features helm, ci, etc., in this flake sooner.  

1. to run clean flake.nix u need only downloaded nix, this available in any distro.

check out this for your platform - https://nixos.org/download/#nix-install-linux

2. run command line to build k3s

'sudo nix develop .#myk3s --extra-experimental-features nix-command --extra-experimental-features flakes'

that's it! 

u can now run 'k9s' and see u cluster running welcome! 

 
