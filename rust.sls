{% if not salt['file.file_exists']('/home/steveno/.cargo/bin/rustc') %}
install_rust:
  cmd.run:
    - runas: steveno
    - name: |
        curl https://sh.rustup.rs -sSf > rustup.sh
        chmod +x rustup.sh
        ./rustup.sh -y
{% endif %}
