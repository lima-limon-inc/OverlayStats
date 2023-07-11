# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An Accounting Application for Small to Midsized Businesses"

HOMEPAGE="https://ledgersmb.org/"

SRC_URI="https://download.ledgersmb.org/f/Releases/${PV}/${PN}-${PV}.tar.gz"

S="${WORKDIR}/${PN}"

LICENSE="GPL-2"

SLOT="2"

KEYWORDS="~amd64"

IUSE="systemd edi excel openoffice latex xetex starman"

RDEPEND="acct-group/ledgersmb
acct-user/ledgersmb
>=dev-lang/perl-5.32
dev-db/postgresql:=
dev-perl/Archive-Zip
dev-perl/Beam-Wire
dev-perl/Authen-SASL
dev-perl/CGI-Emulate-PSGI
dev-perl/Config-IniFiles
>=dev-perl/Cookie-Baker-0.10
>=dev-perl/DBD-Pg-3.3.0
>=dev-perl/DBI-1.635
dev-perl/Data-UUID
dev-perl/DateTime
>=dev-perl/DateTime-Format-Duration-ISO8601-0.008
dev-perl/DateTime-Format-Strptime
dev-perl/Email-MessageID
dev-perl/Email-Sender
dev-perl/Email-Stuffer
dev-perl/Feature-Compat-Try
dev-perl/File-Find-Rule
dev-perl/Hash-Merge
dev-perl/HTML-Parser
dev-perl/HTML-Escape
dev-perl/HTTP-AcceptLanguage
dev-perl/HTTP-Headers-Fast
dev-perl/HTTP-Negotiate
dev-perl/HTTP-Message
dev-perl/IO-stringy
dev-perl/JSON-MaybeXS
dev-perl/JSONSchema-Validator
dev-perl/Cpanel-JSON-XS
dev-perl/List-MoreUtils
dev-perl/Locale-CLDR
dev-perl/Locales
>=dev-perl/Locale-Maketext-Lexicon-0.62
dev-perl/Log-Any
dev-perl/Log-Any-Adapter-Log4perl
dev-perl/Log-Log4perl
dev-perl/libwww-perl
dev-perl/MIME-Types
dev-perl/Module-Runtime
dev-perl/Moo
dev-perl/MooX-Types-MooseLike
dev-perl/Moose
dev-perl/MooseX-ClassAttribute
dev-perl/MooseX-NonMoose
dev-perl/Number-Format
>=dev-perl/PGObject-2.3.2
>=dev-perl/PGObject-Simple-3.1.0
>=dev-perl/PGObject-Simple-Role-2.1.1
>=dev-perl/PGObject-Type-BigFloat-2.0.1
>=dev-perl/PGObject-Type-DateTime-2.0.2
>=dev-perl/PGObject-Type-ByteString-1.2.3
dev-perl/PGObject-Util-DBMethod
>=dev-perl/PGObject-Util-DBAdmin-1.6.1
>=dev-perl/Plack-1.0031
dev-perl/Plack-Builder-Conditionals
dev-perl/Plack-Middleware-ReverseProxy
dev-perl/Plack-Request-WithEncoding
dev-perl/Pod-Parser
dev-perl/Scope-Guard
dev-perl/Session-Storage-Secure
dev-perl/String-Random
>=dev-perl/Template-Toolkit-2.14
dev-perl/Text-CSV
dev-perl/Text-Markdown
dev-perl/URI
>=dev-perl/Workflow-1.56
dev-perl/XML-LibXML
dev-perl/YAML-PP
dev-perl/namespace-autoclean
dev-perl/Math-BigInt-GMP
starman? ( dev-perl/Starman )
edi? ( 
     dev-perl/X12 
     dev-perl/Path-Class
	 )
latex? ( 
       >=dev-perl/LaTeX-Driver-1.0.0 
       >=dev-perl/Template-Plugin-Latex-3.08 
	   app-text/texlive[extra]
	   )
xetex? ( 
       >=dev-perl/LaTeX-Driver-1.0.0 
       >=dev-perl/Template-Plugin-Latex-3.08 
	   app-text/texlive[extra,xetex]
	   )
excel? (
      dev-perl/Spreadsheet-WriteExcel
	  dev-perl/Excel-Writer-XLSX
	  )
"

PATCHES=(
    "${FILESDIR}/ledgersmb-1.10-systemd.patch"
	"${FILESDIR}/ledgersmb-1.10-openrc.patch"
)

#DEPEND="${RDEPEND}"

src_install() {
    dodir /usr/share/ledgersmb-1.10
	for a in UI bin doc lib locale old package* sql templates utils workflows webpack.config.js
	do
	    echo cp -R ${S}/$a ${D}/usr/share/ledgersmb-1.10
	    cp -R ${S}/$a ${D}/usr/share/ledgersmb-1.10  || die "Install Failed"
	done
    if ((use systemd))
	   then
	   insinto /etc/systemd/system/
	   newins /doc/conf/systemd/ledgersmb_starman.service ledgersmb_19.service
	else
	   exeinto  /etc/init.d
	   dodir /var/log/ledgersmb
	   chown ledgersmb:ledgersmb "${D}"/var/log/ledgersmb
	   chown root:root "${S}"/doc/conf/openrc/ledgersmb_starman
	   chmod 744 "${S}"/doc/conf/openrc/init.d/ledgersmb_starman
	   newexe "${S}"/doc/conf/openrc/init.d/ledgersmb_starman ledgersmb_1_10
	   chmod 744 "${D}"/etc/init.d/ledgersmb_1_10
	   newconfd "${S}"/doc/conf/openrc/conf.d/ledgersmb_starman ledgersmb_1_10
	fi
	dodoc -r "${S}"/doc

}
