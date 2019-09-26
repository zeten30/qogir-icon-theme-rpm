#!/bin/bash

WDIR=$(pwd)

# Clean old sources
mkdir -p sources/
rm -rf sources/*
mkdir -p sources/qogir-icon-theme

# Upstream sync
mkdir -p upstream
cd upstream || exit 1

if [ -d Qogir-icon-theme ]; then
  rm -rf Qogir-icon-theme
fi

git clone https://github.com/vinceliuice/Qogir-icon-theme.git

# Install to sources
cd Qogir-icon-theme || exit 1
./install.sh --dest "${WDIR}/sources/qogir-icon-theme"

cd ../../sources || exit 1

# Create source tarball
mkdir -p ../rpmbuild/
rm -rf ../rpmbuild/*.*
tar cfz qogir-icon-theme.tar.gz qogir-icon-theme
mv qogir-icon-theme.tar.gz ../rpmbuild/

# Back to buildroot
cd ../ || exit 1
