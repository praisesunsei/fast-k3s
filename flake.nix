{
  description = "Automated Kubernetes setup with K3s and deploy without shellHook";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; 

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.myApp = with nixpkgs.legacyPackages.x86_64-linux; mkShell {
      buildInputs = [
        k3s
        kubectl
        helm
        fluxcd
        k9s
        glab
        fish
#add your packages && check them for availability with nix search 
      ];
    

shellHook = ''
k3s server > /dev/null 2>&1 &
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml   
'';
    };
    # service for k3s 
    systemd.services.k3s = {
      description = "K3s Kubernetes Service";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${nixpkgs.k3s}/bin/k3s server";
        Restart = "always";
      };
    };
  };
}
