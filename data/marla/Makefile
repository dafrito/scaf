include site.config

build:
.PHONY: build

PACKAGE=$(shell echo $(SITE) | sed -e 's/\./-/g')
SITESHARE=$(MARLASHARE)/$(SITE)
SITEDATA=/usr/share/$(NAME)/$(SITE)

install: install-httpd install-share
.PHONY: install

# Site-specific Apache configuration
httpdconf=$(HTTPDETC)/sites.d/$(PACKAGE).conf

install-httpd: $(httpdconf)
.PHONY: install-httpd

$(httpdconf): $(HTTPDETC)/sites.d httpd.conf
	touch httpd.conf-wip
	
	# Add listen directives, if needed
	if test x"$(LISTEN_PORTS)" != x; then \
		for p in $(LISTEN_PORTS); do \
			echo "Listen $(IP):$$p" >>httpd.conf-wip; \
		done; \
		echo >>httpd.conf-wip; \
	fi
	cat httpd.conf >>httpd.conf-wip
		
	# Use [@] to ensure we don't get substitutions
	sed -i                                                \
		-e "s#[@]HTTPDMARLA@#$(HTTPDMARLA)#g"             \
		-e "s#[@]DOMAIN@#$(DOMAIN)#g"                     \
		-e "s/[@]SITE@/$(SITE)/g"                         \
		-e "s/[@]PACKAGE@/$(PACKAGE)/g"                   \
		-e "s/[@]IP@/$(IP)/g"                             \
		-e "s/[@]PORT@/$(PORT)/g"                         \
		-e "s/[@]SECURE_PORT@/$(SECURE_PORT)/g"           \
		-e "s#[@]SITESHARE@#$(SITEDATA)#g"               \
	httpd.conf-wip;
	mv httpd.conf-wip $@

tar: $(SITE).tar.gz
.PHONY: tar

$(SITE).tar.gz: cgi static httpd.conf Makefile site.config
	tar cvzf $@ \
		--exclude-vcs \
		--exclude-backups \
		--exclude='README' \
		--exclude='**-wip' \
		--transform='s,^,$(SITE),g' \
		$^;

spec: rpm.spec
.PHONY: spec

rpm.spec: rpm.spec.in
	cp $< $@-wip
	sed -i                                                \
		-e "s/[@]SITE@/$(SITE)/g"                         \
		-e "s/[@]PACKAGE@/$(PACKAGE)/g"                   \
	$@-wip;
	mv $@-wip $@

$(HTTPDETC)/sites.d: $(HTTPDETC)
	mkdir -p $@

install-share: $(SITESHARE)
	cp -r cgi static $(SITESHARE)
	find $(SITESHARE)/cgi -type f | xargs sed -i          \
		-e "s#[@]HTTPDMARLA@#$(HTTPDMARLA)#g"             \
		-e "s/[@]DOMAIN@/$(DOMAIN)/g"                     \
		-e "s/[@]SITE@/$(SITE)/g"                         \
		-e "s/[@]PACKAGE@/$(PACKAGE)/g"                   \
		-e "s/[@]IP@/$(IP)/g"                             \
		-e "s/[@]PORT@/$(PORT)/g"                         \
		-e "s/[@]SECURE_PORT@/$(SECURE_PORT)/g"           \
		-e "s#[@]SITESHARE@#$(SITEDATA)#g";
.PHONY: install-share

$(SITESHARE):
	mkdir -p $@

uninstall:
	# Add a couple variable checks, just to be safe
	if test x$(PACKAGE) != x; then                 \
		rm -f $(HTTPDETC)/sites.d/$(PACKAGE).conf; \
	fi;
	if test x$(SITESHARE) != x; then               \
		rm -rf $(SITESHARE);                       \
	fi;
.PHONY: uninstall

clean:
.PHONY: clean
