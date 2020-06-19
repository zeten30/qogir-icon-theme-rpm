# RPM Makefile
RELEASE=32

build:
	./create-sources.sh

srpm: build
	mock -r fedora-$(RELEASE)-x86_64 --spec qogir-icon-theme.spec --sources rpmbuild/ --resultdir rpmbuild/ --buildsrpm

rpm: srpm
	mock -r fedora-$(RELEASE)-x86_64 --rebuild rpmbuild/qogir-*.src.rpm --resultdir rpmbuild/

copr: srpm
	copr-cli build mzink/Utils rpmbuild/qogir-*.src.rpm --nowait
