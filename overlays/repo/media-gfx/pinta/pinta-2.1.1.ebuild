# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
inherit xdg-utils
DESCRIPTION="Painting Made Simple"
HOMEPAGE="https://www.pinta-project.com/"
SRC_URI="https://github.com/PintaProject/Pinta/releases/download/${PV}/pinta-${PV}.tar.gz https://globalcdn.nuget.org/packages/paragonclipper.6.4.2.nupkg -> paragonclipper-6.4.2.pkg.zip https://www.nuget.org/api/v2/package/ngettext/0.6.7 -> ngettext-0.6.7.pkg.zip https://globalcdn.nuget.org/packages/sharpziplib.1.4.1.nupkg -> sharpziplib-1.4.1.pkg.zip https://globalcdn.nuget.org/packages/nunit.3.13.3.nupkg -> nunit-3.13.3.pkg.zip https://globalcdn.nuget.org/packages/nunit3testadapter.4.3.1.nupkg -> nunit3testadapter-4.3.1.pkg.zip https://globalcdn.nuget.org/packages/netstandard.library.2.0.0.nupkg -> netstandard.library-2.0.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.netcore.platforms.1.1.0.nupkg -> Microsoft.NETCore.Platforms-1.1.0.m.pkg.zip https://globalcdn.nuget.org/packages/tmds.dbus.0.11.0.nupkg -> tmds.dbus-0.11.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.bcl.asyncinterfaces.6.0.0.nupkg -> Microsoft.Bcl.AsyncInterfaces-6.0.0.m.pkg.zip https://globalcdn.nuget.org/packages/system.security.principal.windows.4.7.0.nupkg -> system.security.principal.windows-4.7.0.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.emit.4.7.0.nupkg -> system.reflection.emit-4.7.0.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.emit.ilgeneration.4.7.0.nupkg -> system.reflection.emit.ilgeneration-4.7.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.net.test.sdk.17.4.1.nupkg -> microsoft.net.test.sdk-17.4.1.pkg.zip https://globalcdn.nuget.org/packages/microsoft.testplatform.testhost.17.4.1.nupkg -> microsoft.testplatform.testhost-17.4.1.pkg.zip https://globalcdn.nuget.org/packages/microsoft.codecoverage.17.4.1.nupkg -> microsoft.codecoverage-17.4.1.pkg.zip https://globalcdn.nuget.org/packages/newtonsoft.json.13.0.1.nupkg -> newtonsoft.json-13.0.1.pkg.zip https://globalcdn.nuget.org/packages/microsoft.testplatform.objectmodel.17.4.1.nupkg -> microsoft.testplatform.objectmodel-17.4.1.pkg.zip https://globalcdn.nuget.org/packages/nuget.frameworks.5.11.0.nupkg -> nuget.frameworks-5.11.0.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.metadata.1.6.0.nupkg -> system.reflection.metadata-1.6.0.pkg.zip https://globalcdn.nuget.org/packages/system.collections.immutable.1.5.0.nupkg -> System.Collections.Immutable-1.5.0.m.pkg.zip https://globalcdn.nuget.org/packages/gtksharp.3.24.24.38.nupkg -> gtksharp-3.24.24.38.pkg.zip https://globalcdn.nuget.org/packages/atksharp.3.24.24.38.nupkg -> atksharp-3.24.24.38.pkg.zip https://globalcdn.nuget.org/packages/cairosharp.3.24.24.38.nupkg -> cairosharp-3.24.24.38.pkg.zip https://globalcdn.nuget.org/packages/gdksharp.3.24.24.38.nupkg -> gdksharp-3.24.24.38.pkg.zip https://globalcdn.nuget.org/packages/giosharp.3.24.24.38.nupkg -> giosharp-3.24.24.38.pkg.zip https://globalcdn.nuget.org/packages/glibsharp.3.24.24.38.nupkg -> glibsharp-3.24.24.38.pkg.zip https://globalcdn.nuget.org/packages/pangosharp.3.24.24.38.nupkg -> pangosharp-3.24.24.38.pkg.zip https://globalcdn.nuget.org/packages/benchmarkdotnet.0.13.2.nupkg -> benchmarkdotnet-0.13.2.pkg.zip https://globalcdn.nuget.org/packages/benchmarkdotnet.annotations.0.13.2.nupkg -> benchmarkdotnet.annotations-0.13.2.pkg.zip https://globalcdn.nuget.org/packages/commandlineparser.2.4.3.nupkg -> commandlineparser-2.4.3.pkg.zip https://globalcdn.nuget.org/packages/iced.1.17.0.nupkg -> iced-1.17.0.pkg.zip https://globalcdn.nuget.org/packages/system.threading.tasks.extensions.4.5.4.nupkg -> system.threading.tasks.extensions-4.5.4.pkg.zip https://globalcdn.nuget.org/packages/system.runtime.compilerservices.unsafe.4.5.3.nupkg -> System.Runtime.CompilerServices.Unsafe-4.5.3.m.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.emit.lightweight.4.7.0.nupkg -> system.reflection.emit.lightweight-4.7.0.pkg.zip https://globalcdn.nuget.org/packages/system.management.6.0.0.nupkg -> system.management-6.0.0.pkg.zip https://globalcdn.nuget.org/packages/system.codedom.6.0.0.nupkg -> system.codedom-6.0.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.diagnostics.tracing.traceevent.3.0.2.nupkg -> microsoft.diagnostics.tracing.traceevent-3.0.2.pkg.zip https://globalcdn.nuget.org/packages/microsoft.dotnet.platformabstractions.3.1.6.nupkg -> microsoft.dotnet.platformabstractions-3.1.6.pkg.zip https://globalcdn.nuget.org/packages/perfolizer.0.2.1.nupkg -> perfolizer-0.2.1.pkg.zip https://globalcdn.nuget.org/packages/system.memory.4.5.3.nupkg -> System.Memory-4.5.3.m.pkg.zip https://globalcdn.nuget.org/packages/microsoft.codeanalysis.csharp.3.0.0.nupkg -> microsoft.codeanalysis.csharp-3.0.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.codeanalysis.common.3.0.0.nupkg -> microsoft.codeanalysis.common-3.0.0.pkg.zip https://globalcdn.nuget.org/packages/system.runtime.compilerservices.unsafe.4.5.0.nupkg -> System.Runtime.CompilerServices.Unsafe-4.5.0.m.pkg.zip https://globalcdn.nuget.org/packages/system.memory.4.5.1.nupkg -> System.Memory-4.5.1.m.pkg.zip https://globalcdn.nuget.org/packages/system.text.encoding.codepages.4.5.0.nupkg -> system.text.encoding.codepages-4.5.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.codeanalysis.analyzers.2.6.2-beta2.nupkg -> microsoft.codeanalysis.analyzers-2.6.2-beta2.pkg.zip https://globalcdn.nuget.org/packages/microsoft.netcore.platforms.2.0.0.nupkg -> Microsoft.NETCore.Platforms-2.0.0.m.pkg.zip https://globalcdn.nuget.org/packages/microsoft.diagnostics.runtime.2.2.332302.nupkg -> microsoft.diagnostics.runtime-2.2.332302.pkg.zip https://globalcdn.nuget.org/packages/system.collections.immutable.5.0.0.nupkg -> System.Collections.Immutable-5.0.0.m.pkg.zip https://globalcdn.nuget.org/packages/system.runtime.compilerservices.unsafe.5.0.0.nupkg -> System.Runtime.CompilerServices.Unsafe-5.0.0.m.pkg.zip https://globalcdn.nuget.org/packages/microsoft.diagnostics.netcore.client.0.2.251802.nupkg -> microsoft.diagnostics.netcore.client-0.2.251802.pkg.zip https://globalcdn.nuget.org/packages/microsoft.bcl.asyncinterfaces.1.1.0.nupkg -> Microsoft.Bcl.AsyncInterfaces-1.1.0.m.pkg.zip https://globalcdn.nuget.org/packages/microsoft.extensions.logging.2.2.0.nupkg -> microsoft.extensions.logging-2.2.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.extensions.dependencyinjection.abstractions.2.2.0.nupkg -> microsoft.extensions.dependencyinjection.abstractions-2.2.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.extensions.logging.abstractions.2.2.0.nupkg -> microsoft.extensions.logging.abstractions-2.2.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.extensions.configuration.binder.2.2.0.nupkg -> microsoft.extensions.configuration.binder-2.2.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.extensions.configuration.2.2.0.nupkg -> microsoft.extensions.configuration-2.2.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.extensions.configuration.abstractions.2.2.0.nupkg -> microsoft.extensions.configuration.abstractions-2.2.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.extensions.primitives.2.2.0.nupkg -> microsoft.extensions.primitives-2.2.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.extensions.options.2.2.0.nupkg -> microsoft.extensions.options-2.2.0.pkg.zip https://globalcdn.nuget.org/packages/system.componentmodel.annotations.4.5.0.nupkg -> system.componentmodel.annotations-4.5.0.pkg.zip"
RESTRICT="mirror"
LICENSE="MIT CC-BY-3.0"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND=">=dev-dotnet/dotnet-sdk-bin-6.0.301 >=sys-apps/coreutils-8.32-r1 >=dev-libs/openssl-1.1.1o >=app-arch/unzip-6.0_p26 >=sys-apps/sed-4.8"
DEPEND="${RDEPEND} jpeg? ( x11-libs/gdk-pixbuf[jpeg] )"
IUSE="+jpeg"

src_prepare() {
	export "DOTNET_CLI_TELEMETRY_OPTOUT=1"
	mkdir "${WORKDIR}/repo"
	ls ${DISTDIR}/*.m.pkg.zip | while read p; do
		unzip -q -d "${WORKDIR}" -o "${p}"
		export "DATA=$(basename "${p}" .m.pkg.zip | sed "s/-/\\n/")"
		export "NAME=$(echo "${DATA}" | head -n 1)"
		mv "${WORKDIR}/${NAME}.nuspec" "${WORKDIR}/${NAME}-$(echo "${DATA}" | tail -n+2).nuspec"
	done
	ls ${WORKDIR}/*.nuspec | while read p; do
		export "LCASE_NAME=$(basename "${p}" | dd status=none conv=lcase)"
		mv "${p}" "${WORKDIR}/${LCASE_NAME}"
	done
	ls ${DISTDIR}/*.pkg.zip | while read p; do
		echo "${p}" | sed -n "/\.m\.pkg\.zip/{q1}"
		if [ $? -eq 1 ]; then
			export "BNAME=$(basename "${p}" .m.pkg.zip | dd status=none conv=lcase)"
		else
			export "BNAME=$(basename "${p}" .pkg.zip)"
		fi
		export "DATA=$(echo "${BNAME}" | sed "s/-/\\n/")"
		export "NAME=$(echo "${DATA}" | head -n 1)"
		export "VER=$(echo "${DATA}" | tail -n+2)"
		export "DIR=${WORKDIR}/repo/${NAME}/${VER}"
		mkdir -p "${DIR}"
		export "NUPKG=$(echo "${BNAME}" | sed "s/-/./").nupkg"
		openssl dgst -sha512 -binary "${p}" | base64 --wrap=0 > "${DIR}/${NUPKG}.sha512"
		cp "${p}" "${DIR}/${NUPKG}"
		if [ -f "${WORKDIR}/${NAME}.nuspec" ]; then
			mv "${WORKDIR}/${NAME}.nuspec" "${DIR}/"
		elif [ -f "${WORKDIR}/${NAME}-${VER}.nuspec" ]; then
			mv "${WORKDIR}/${NAME}-${VER}.nuspec" "${DIR}/${NAME}.nuspec"
		fi
	done

	cp -r /opt/dotnet-sdk-bin-* "${WORKDIR}/host"
	export "PATH=${WORKDIR}/host:${PATH}"
	export "DOTNET_ROOT=${WORKDIR}/host"

	dotnet nuget remove source nuget.org
	dotnet nuget add source -n pinta_repo "${WORKDIR}/repo"
	echo
	echo "--------------------------------------------------------------------------------------"
	echo "    PLEASE NOTE"
	echo "--------------------------------------------------------------------------------------"
	echo
	echo "      warning #1: don't worry if it hangs! it will finish, just wait."
	echo
	echo "      warning #2: you might get warnings about Microsoft.Extensions.Logging..."
	echo "                  ignore them, using the recommended version crashes the process"
	echo
	echo "waiting 5 seconds..."
	sleep 5
	eapply_user
}

src_install() {
	emake DESTDIR="${D}" install
	rm ${D}/usr/share/man/man1/*.gz
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
