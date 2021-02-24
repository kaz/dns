OCTODNS=docker run -ti --rm --env-file .env --volume $(PWD):/workdir octodns --config-file dns.yaml

.PHONY: plan
plan: image .env
	$(OCTODNS) $(OPTS)

.PHONY: apply
apply: image .env
	$(OCTODNS) --doit

.PHONY: image
image:
	docker build --quiet --tag octodns .

.PHONY: encrypt
encrypt:
	gpg --default-recipient-self --encrypt .env

.env:
	gpg --output $@ --decrypt $@.gpg
