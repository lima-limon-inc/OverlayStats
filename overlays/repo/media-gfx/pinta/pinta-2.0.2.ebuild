# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
inherit xdg-utils
DESCRIPTION="Painting Made Simple"
HOMEPAGE="https://www.pinta-project.com/"
SRC_URI="https://github.com/PintaProject/Pinta/releases/download/${PV}/pinta-${PV}.tar.gz https://globalcdn.nuget.org/packages/atksharp.3.24.24.34.nupkg -> atksharp-3.24.24.34.pkg.zip https://globalcdn.nuget.org/packages/cairosharp.3.24.24.34.nupkg -> cairosharp-3.24.24.34.pkg.zip https://globalcdn.nuget.org/packages/gdksharp.3.24.24.34.nupkg -> gdksharp-3.24.24.34.pkg.zip https://globalcdn.nuget.org/packages/giosharp.3.24.24.34.nupkg -> giosharp-3.24.24.34.pkg.zip https://globalcdn.nuget.org/packages/glibsharp.3.24.24.34.nupkg -> glibsharp-3.24.24.34.pkg.zip https://globalcdn.nuget.org/packages/gtksharp.3.24.24.34.nupkg -> gtksharp-3.24.24.34.pkg.zip https://globalcdn.nuget.org/packages/microsoft.codecoverage.17.0.0.nupkg -> microsoft.codecoverage-17.0.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.csharp.4.0.1.nupkg -> microsoft.csharp-4.0.1.pkg.zip https://globalcdn.nuget.org/packages/microsoft.netcore.platforms.1.0.1.nupkg -> Microsoft.NETCore.Platforms-1.0.1.m.pkg.zip https://globalcdn.nuget.org/packages/microsoft.netcore.platforms.1.1.0.nupkg -> Microsoft.NETCore.Platforms-1.1.0.m.pkg.zip https://globalcdn.nuget.org/packages/microsoft.netcore.targets.1.0.1.nupkg -> Microsoft.NETCore.Targets-1.0.1.m.pkg.zip https://globalcdn.nuget.org/packages/microsoft.netcore.targets.1.1.0.nupkg -> Microsoft.NETCore.Targets-1.1.0.m.pkg.zip https://globalcdn.nuget.org/packages/microsoft.net.test.sdk.17.0.0.nupkg -> microsoft.net.test.sdk-17.0.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.testplatform.objectmodel.17.0.0.nupkg -> microsoft.testplatform.objectmodel-17.0.0.pkg.zip https://globalcdn.nuget.org/packages/microsoft.testplatform.testhost.17.0.0.nupkg -> microsoft.testplatform.testhost-17.0.0.pkg.zip https://globalcdn.nuget.org/packages/netstandard.library.2.0.0.nupkg -> netstandard.library-2.0.0.pkg.zip https://globalcdn.nuget.org/packages/newtonsoft.json.9.0.1.nupkg -> newtonsoft.json-9.0.1.pkg.zip https://globalcdn.nuget.org/packages/ngettext.0.6.7.nupkg -> ngettext-0.6.7.pkg.zip https://globalcdn.nuget.org/packages/nuget.frameworks.5.0.0.nupkg -> nuget.frameworks-5.0.0.pkg.zip https://globalcdn.nuget.org/packages/nunit.3.13.2.nupkg -> nunit-3.13.2.pkg.zip https://globalcdn.nuget.org/packages/nunit3testadapter.4.1.0.nupkg -> nunit3testadapter-4.1.0.pkg.zip https://globalcdn.nuget.org/packages/pangosharp.3.24.24.34.nupkg -> pangosharp-3.24.24.34.pkg.zip https://globalcdn.nuget.org/packages/paragonclipper.6.4.2.nupkg -> paragonclipper-6.4.2.pkg.zip https://globalcdn.nuget.org/packages/sharpziplib.1.3.3.nupkg -> sharpziplib-1.3.3.pkg.zip https://globalcdn.nuget.org/packages/system.collections.4.0.11.nupkg -> system.collections-4.0.11.pkg.zip https://globalcdn.nuget.org/packages/system.diagnostics.debug.4.0.11.nupkg -> system.diagnostics.debug-4.0.11.pkg.zip https://globalcdn.nuget.org/packages/system.diagnostics.tools.4.0.1.nupkg -> system.diagnostics.tools-4.0.1.pkg.zip https://globalcdn.nuget.org/packages/system.dynamic.runtime.4.0.11.nupkg -> system.dynamic.runtime-4.0.11.pkg.zip https://globalcdn.nuget.org/packages/system.globalization.4.0.11.nupkg -> system.globalization-4.0.11.pkg.zip https://globalcdn.nuget.org/packages/system.io.4.1.0.nupkg -> system.io-4.1.0.pkg.zip https://globalcdn.nuget.org/packages/system.io.filesystem.4.0.1.nupkg -> system.io.filesystem-4.0.1.pkg.zip https://globalcdn.nuget.org/packages/system.io.filesystem.primitives.4.0.1.nupkg -> system.io.filesystem.primitives-4.0.1.pkg.zip https://globalcdn.nuget.org/packages/system.linq.4.1.0.nupkg -> system.linq-4.1.0.pkg.zip https://globalcdn.nuget.org/packages/system.linq.expressions.4.1.0.nupkg -> system.linq.expressions-4.1.0.pkg.zip https://globalcdn.nuget.org/packages/system.objectmodel.4.0.12.nupkg -> system.objectmodel-4.0.12.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.4.1.0.nupkg -> system.reflection-4.1.0.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.emit.4.0.1.nupkg -> system.reflection.emit-4.0.1.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.emit.ilgeneration.4.0.1.nupkg -> system.reflection.emit.ilgeneration-4.0.1.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.emit.lightweight.4.0.1.nupkg -> system.reflection.emit.lightweight-4.0.1.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.extensions.4.0.1.nupkg -> system.reflection.extensions-4.0.1.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.metadata.1.6.0.nupkg -> system.reflection.metadata-1.6.0.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.primitives.4.0.1.nupkg -> system.reflection.primitives-4.0.1.pkg.zip https://globalcdn.nuget.org/packages/system.reflection.typeextensions.4.1.0.nupkg -> system.reflection.typeextensions-4.1.0.pkg.zip https://globalcdn.nuget.org/packages/system.resources.resourcemanager.4.0.1.nupkg -> system.resources.resourcemanager-4.0.1.pkg.zip https://globalcdn.nuget.org/packages/system.runtime.4.1.0.nupkg -> system.runtime-4.1.0.pkg.zip https://globalcdn.nuget.org/packages/system.runtime.extensions.4.1.0.nupkg -> system.runtime.extensions-4.1.0.pkg.zip https://globalcdn.nuget.org/packages/system.runtime.handles.4.0.1.nupkg -> system.runtime.handles-4.0.1.pkg.zip https://globalcdn.nuget.org/packages/system.runtime.interopservices.4.1.0.nupkg -> system.runtime.interopservices-4.1.0.pkg.zip https://globalcdn.nuget.org/packages/system.runtime.serialization.primitives.4.1.1.nupkg -> system.runtime.serialization.primitives-4.1.1.pkg.zip https://globalcdn.nuget.org/packages/system.text.encoding.4.0.11.nupkg -> system.text.encoding-4.0.11.pkg.zip https://globalcdn.nuget.org/packages/system.text.encoding.extensions.4.0.11.nupkg -> system.text.encoding.extensions-4.0.11.pkg.zip https://globalcdn.nuget.org/packages/system.text.regularexpressions.4.1.0.nupkg -> system.text.regularexpressions-4.1.0.pkg.zip https://globalcdn.nuget.org/packages/system.threading.4.0.11.nupkg -> system.threading-4.0.11.pkg.zip https://globalcdn.nuget.org/packages/system.threading.tasks.4.0.11.nupkg -> system.threading.tasks-4.0.11.pkg.zip https://globalcdn.nuget.org/packages/system.threading.tasks.extensions.4.0.0.nupkg -> system.threading.tasks.extensions-4.0.0.pkg.zip https://globalcdn.nuget.org/packages/system.xml.readerwriter.4.0.11.nupkg -> system.xml.readerwriter-4.0.11.pkg.zip https://globalcdn.nuget.org/packages/system.xml.xdocument.4.0.11.nupkg -> system.xml.xdocument-4.0.11.pkg.zip"
LICENSE="MIT CC-BY-3.0"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND=">=dev-dotnet/dotnet-sdk-bin-6.0.301 >=sys-apps/coreutils-8.32-r1 >=dev-libs/openssl-1.1.1o >=app-arch/unzip-6.0_p26 >=sys-apps/sed-4.8"
DEPEND="${RDEPEND}"

src_prepare() {
	export "DOTNET_CLI_TELEMETERY_OPTOUT=1"
	mkdir "${WORKDIR}/repo"
	ls ${DISTDIR}/*.m.pkg.zip | while read p; do
		unzip -q -d "${WORKDIR}" -o "${p}"
		export "DATA=$(basename "${p}" .m.pkg.zip | sed "s/-/\\n/")"
		export "NAME=$(echo "${DATA}" | head -n 1)"
		mv "${WORKDIR}/${NAME}.nuspec" "${WORKDIR}/${NAME}-$(echo "${DATA}" | tail -n 1).nuspec"
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
		export "VER=$(echo "${DATA}" | tail -n 1)"
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

	cp -r "/opt/dotnet-sdk-bin-6.0" "${WORKDIR}/host"
	export "PATH=${WORKDIR}/host:${PATH}"
	export "DOTNET_ROOT=${WORKDIR}/host"

	dotnet nuget remove source nuget.org
	dotnet nuget add source -n pinta_repo "${WORKDIR}/repo"
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
