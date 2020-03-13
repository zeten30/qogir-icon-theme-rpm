Name:           qogir-icon-theme
Version:        2020.03
Release:        1%{?dist}
Summary:        A colorful design icon theme for linux desktops

License:        GPLv2
URL:            https://github.com/vinceliuice/Qogir-icon-theme.git
Source0:        qogir-icon-theme.tar.gz

BuildArch:      noarch
BuildRequires:  bash
BuildRequires:  bc
Requires:       gnome-themes-extra

%description
A flat colorful design icon theme for linux desktops.


%prep
%setup -q -n qogir-icon-theme


%build
# Nothing to build
%install
%{__install} -d -m755 %{buildroot}%{_datadir}/icons/
for file in Qogir Qogir-dark Qogir-manjaro Qogir-manjaro-dark Qogir-ubuntu Qogir-ubuntu-dark  ; do
  %{__cp} -pr ${file} %{buildroot}%{_datadir}/icons/
done


%files
%defattr(-,root,root)
%{_datadir}/icons/Qogir
%{_datadir}/icons/Qogir-dark
%{_datadir}/icons/Qogir-manjaro
%{_datadir}/icons/Qogir-manjaro-dark
%{_datadir}/icons/Qogir-ubuntu
%{_datadir}/icons/Qogir-ubuntu-dark


%changelog
* Thu Sep 26 2019 Milan Zink <zeten30@gmail.com> - 2019.09.1
- initial release
