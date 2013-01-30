Name:           @@PROJECT_SPECNAME@@
Version:        1.0
Release:        1%{?dist}
Summary:        TODO Write a one-line specfile summary

Group:          TODO Categorize this Perl module
License:        MIT
URL:            @@WEBSITE@@
Source0:        @@WEBSITE@@/@@PROJECT_DASHES@@.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildArch:      noarch
BuildRequires:  perl(ExtUtils::MakeMaker)
Requires:       perl(:MODULE_COMPAT_%(eval "`%{__perl} -V:version`"; echo $version))

%description
TODO Write a multi-line specfile description

%prep
%setup -q -n @@PROJECT_DASHES@@

%build
%{__perl} Makefile.PL INSTALLDIRS=vendor
make %{?_smp_mflags}

%install
rm -rf $RPM_BUILD_ROOT

make pure_install PERL_INSTALL_ROOT=$RPM_BUILD_ROOT

find $RPM_BUILD_ROOT -type f -name .packlist -exec rm -f {} \;
find $RPM_BUILD_ROOT -depth -type d -exec rmdir {} 2>/dev/null \;

%{_fixperms} $RPM_BUILD_ROOT/*

%check
TEST_POD=1 make test

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
# For noarch packages: vendorlib
%{perl_vendorlib}/*

%changelog
* @@DATE@@ @@OWNER@@ <@@EMAIL@@> - 1.0
- Initial release
