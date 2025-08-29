# buildah bud -t fedora-toolbox-ikke:42 Containerfile-f42
# just to force build
FROM registry.fedoraproject.org/fedora-toolbox:38
COPY requirements.txt /tmp/
RUN dnf -y install \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
  #dnf copr enable atim/lazygit -y && \
  dnf remove -y xdg-open && \
  dnf install --setopt=install_weak_deps=False -y \
    git \
    jq \
   # lazygit \
    nmap \
#   python3 \
    python3-pip \
    tmux \
    tmux-powerline \
    wl-clipboard && \
    pip3 install -r /tmp/requirements.txt && \
  dnf update -y && \
  dnf clean all
