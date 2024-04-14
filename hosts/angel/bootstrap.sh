sudo nix --experimental-features "nix-command flakes" \
run github:nix-community/disko -- \
--mode disko "$1" \
--arg device "$2"
#1 = location of disko configuration
#2 = name of /dev/sdx
