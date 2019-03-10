all: generate_json

generate_json:
	cat ubuntu-minimal.yml | ruby -r json -r yaml -e "yaml = YAML.load(ARGF.read); print yaml.to_json" > ubuntu-minimal.json

artful: generate_json
	VM_NAME=ubuntu-mini-$@ DISTRO_CODENAME=$@ packer validate ubuntu-minimal.json \
		&& 	VM_NAME=ubuntu-mini-$@ DISTRO_CODENAME=$@ packer build ubuntu-minimal.json 

bionic: generate_json
	VM_NAME=ubuntu-mini-$@ DISTRO_CODENAME=$@ packer validate ubuntu-minimal.json \
		&& 	VM_NAME=ubuntu-mini-$@ DISTRO_CODENAME=$@ packer build ubuntu-minimal.json

cosmic: generate_json
	VM_NAME=ubuntu-mini-$@ DISTRO_CODENAME=$@ packer validate ubuntu-minimal.json \
		&& 	VM_NAME=ubuntu-mini-$@ DISTRO_CODENAME=$@ packer build ubuntu-minimal.json