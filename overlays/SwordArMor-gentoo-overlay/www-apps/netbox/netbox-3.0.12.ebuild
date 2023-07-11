# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..11} )
inherit python-single-r1 readme.gentoo-r1

DESCRIPTION="IP address and data center infrastructure management tool"
HOMEPAGE="https://github.com/netbox-community/netbox"
SRC_URI="https://github.com/netbox-community/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ldap"
REQUIRED_USE=${PYTHON_REQUIRED_USE}

RDEPEND="
	acct-group/netbox
	acct-user/netbox
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		>=dev-python/django-3.2.9[${PYTHON_USEDEP}]
		<dev-python/django-4[${PYTHON_USEDEP}]
		>=dev-python/django-cors-headers-3.10.0[${PYTHON_USEDEP}]
		>=dev-python/django-debug-toolbar-3.2.2[${PYTHON_USEDEP}]
		>=dev-python/django-filter-21.1[${PYTHON_USEDEP}]
		>=dev-python/django-graphiql-debug-toolbar-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/django-mptt-0.13.4[${PYTHON_USEDEP}]
		>=dev-python/django-pglocks-1.0.4[${PYTHON_USEDEP}]
		>=dev-python/django-prometheus-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/django-redis-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/django-rq-2.5.1[${PYTHON_USEDEP}]
		>=dev-python/django-tables2-2.4.1[${PYTHON_USEDEP}]
		>=dev-python/django-taggit-1.5.1[${PYTHON_USEDEP}]
		>=dev-python/django-timezone-field-4.2.1[${PYTHON_USEDEP}]
		>=dev-python/djangorestframework-3.12.4[${PYTHON_USEDEP}]
		>=dev-python/drf-yasg-1.20.0[${PYTHON_USEDEP},validation]
		>=dev-python/graphene-django-2.15.0[${PYTHON_USEDEP}]
		>=www-servers/gunicorn-20.1.0[${PYTHON_USEDEP}]
		>=dev-python/jinja-3.0.3[${PYTHON_USEDEP}]
		>=dev-python/markdown-3.3.6[${PYTHON_USEDEP}]
		>=dev-python/markdown-include-0.6.0[${PYTHON_USEDEP}]
		>=dev-python/mkdocs-material-7.3.6[${PYTHON_USEDEP}]
		>=dev-python/netaddr-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-8.4.0[${PYTHON_USEDEP}]
		dev-python/psycopg:2[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/svgwrite-1.4.1[${PYTHON_USEDEP}]
		>=dev-python/tablib-3.1.0[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-3.2.0[${PYTHON_USEDEP}]
		ldap? ( >=dev-python/django-auth-ldap-4.1.0[${PYTHON_USEDEP}] )
	')"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${P}-no-pip.patch
)

DISABLE_AUTOFORMATTING=YES
DOC_CONTENTS="
netbox is installed on your system. However, there are some manual steps
you need to complete from the installation guide [1].

On Gentoo, the configuration files you need to edit are located in
/etc/netbox, not /opt/netbox as shown in the installation guide.

If this is a new installation, please follow the installation guide
other than this difference. Also, if you need ldap, set the appropriate
use flag when emerging netbox to install the dependency for it.

Once that is done, you should be able to add the netbox service to the
default runlevel and start it.

If you want to use webhooks,  you should also add the netbox-rqworker
service to the default runlevel and start it.

If this is an upgrade, follow these instructions:

Stop the netbox service. If the  netbox-rqworker service is running,
stop it as well.

Next, run the upgrade script as described in the upgrading guide[2].

Next, check for new configuration options and set them as appropriate
for your system.

Next, start the netbox service.

Finally, if you are using webhooks, start the netbox-rqworker service.

[1] https://netbox.readthedocs.io/en/stable/installation/
[2] https://netbox.readthedocs.io/en/stable/installation/upgrading/
"

src_install() {
	dodir /opt
	cp -a ../${P} "${ED}"/opt
	dosym ${P} /opt/netbox
	dosym /etc/netbox/gunicorn_config.py /opt/netbox/gunicorn_config.py
	dosym /etc/netbox/configuration.py \
		/opt/netbox/netbox/netbox/configuration.py
	dodir /etc/netbox
	insinto /etc/netbox
	newins netbox/netbox/configuration.example.py configuration.py
	doins "${FILESDIR}"/gunicorn_config.py
	fowners -R netbox:netbox /etc/netbox /opt/${P}
	fowners -h netbox:netbox /opt/netbox
	fperms o= /etc/netbox/configuration.py /etc/netbox/gunicorn_config.py
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newinitd "${FILESDIR}"/${PN}-rqworker.initd ${PN}-rqworker
	keepdir /var/log/netbox
	fowners -R netbox:netbox /var/log/netbox
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
	for LAST_PREVIOUS_VERSION in $REPLACING_VERSIONS; do
		if [[ "$LAST_PREVIOUS_VERSION" = "2.5.10" ]]; then
			ewarn "The home directory of the netbox user is now /var/lib/netbox"
			ewarn "Please adjust your system."
		fi
	done

	if [ -z "${LAST_PREVIOUS_VERSION}" ]; then
		exit
	fi

	LAST_BASE_DIRECTORY="/opt/netbox-${LAST_PREVIOUS_VERSION}"
	NBCP="su -l ${PN} -s /bin/sh -c cp"
	if [ -f "${LAST_BASE_DIRECTORY}/local_requirements.txt}" ]; then
		${NBCP} "${LAST_BASE_DIRECTORY}/local_requirements.txt}" /opt/netbox
	fi
	if [ -f "${LAST_BASE_DIRECTORY}/netbox/netbox/ldap_config.py" ]; then
		${NBCP} "${LAST_BASE_DIRECTORY}/netbox/netbox/ldap_config.py" /opt/netbox/netbox/netbox/
	fi
	if [ -d "${LAST_BASE_DIRECTORY}/netbox/media" ]; then
		${NBCP} -pr "${LAST_BASE_DIRECTORY}/netbox/media" /opt/netbox/netbox/
	fi
	if [ -d "${LAST_BASE_DIRECTORY}/netbox/scripts" ]; then
		${NBCP} -pr "${LAST_BASE_DIRECTORY}/netbox/scripts" /opt/netbox/netbox/
	fi
	if [ -d "${LAST_BASE_DIRECTORY}/netbox/reports" ]; then
		${NBCP} -pr "${LAST_BASE_DIRECTORY}/netbox/reports" /opt/netbox/netbox/
	fi
	su -p -s /bin/sh -c "/opt/${P}/upgrade.sh" "${PN}"
}
