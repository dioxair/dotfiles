# Based onMr. Cejas's blog, with some minor adjustments for displaying: https://fernandocejas.com/blog/engineering/2022-03-30-arch-linux-system-maintance/
YELLOW="\033[1;33m"
GREEN="\033[0;32m"
NC="\033[0m" # No Color

echo -e "${YELLOW}Updating system${NC}\n"
yay -Syu

echo -e "${YELLOW}Clearing pacman cache${NC}\n"
pacman_cache_space_used="$(du -sh /var/cache/pacman/pkg/)"
# need pacman-contrib package
paccache -r
echo -e "${GREEN}Space saved: $pacman_cache_space_used${NC}\n"

echo -e "${YELLOW}Removing orphan packages${NC}\n"
yay -Qdtq | yay -Rns -

echo -e "${YELLOW}Clearing ~/.cache${NC}\n"
home_cache_used="$(du -sh ~/.cache)"
rm -rf ~/.cache/
echo -e "${GREEN}Spaced saved: $home_cache_used${NC}\n"

echo -e "${YELLOW}Clearing system logs${NC}\n"
sudo journalctl --vacuum-time=7d
