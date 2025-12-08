sudo apt-get purge  -y fuse-overlayfs docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && sudo apt-get autoremove -y 
echo "All done. Please log out and log back in to run docker without sudo"
