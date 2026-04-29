# =============================================================================
# LaTeX Dev Container (independent)
# Debian Bookworm base with OpenCode, OpenSpec, and a lightweight LaTeX stack.
# =============================================================================
FROM mcr.microsoft.com/devcontainers/base:bookworm
ENV DEBIAN_FRONTEND=noninteractive

USER root

# Install essential build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    gnupg \
    build-essential \
    git \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js LTS via GPG-verified nodesource repository
ARG NODE_MAJOR=22
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
       | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" \
       > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get purge -y gnupg \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Install OpenCode and OpenSpec globally
RUN npm install -g @fission-ai/openspec@latest opencode-ai

# ---------------------------------------------------------------------------
# Install lightweight LaTeX distribution (with reasonable coverage)
# ---------------------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    texlive-science \
    texlive-pictures \
    latexmk \
    biber \
    chktex \
    && rm -rf /var/lib/apt/lists/*

# Ensure vscode user shell is set to zsh (the base image already creates vscode)
USER vscode
WORKDIR /workspaces
