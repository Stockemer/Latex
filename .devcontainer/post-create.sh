#!/bin/bash
set -eu

echo "Starting LaTeX devcontainer post-create script..."

# Copy host .gitconfig into container home
if [ -f /mnt/host-gitconfig ]; then
    echo "Copying host .gitconfig into container..."
    cp /mnt/host-gitconfig "$HOME/.gitconfig"
else
    echo "No host .gitconfig found; creating minimal placeholder."
    git config --global init.defaultBranch main
fi

echo "LaTeX devcontainer post-create script done!"
