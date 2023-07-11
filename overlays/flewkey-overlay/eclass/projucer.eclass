# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: projucer.eclass
# @MAINTAINER:
# Ryan Fox <flewkey@2a03.party>
# @AUTHOR:
# Ryan Fox <flewkey@2a03.party>
# @BLURB: Resave Projucer projects
# @DESCRIPTION:
# Provides a function to resave Projucer projects, and automatically sets the
# paths for JUCE and it's modules.

# @ECLASS_VARIABLE: JUCE_VERSION
# @REQUIRED
# @DEFAULT_UNSET
# @DESCRIPTION:
# Choose a specific version of JUCE to use. A project may only build with older
# versions of JUCE.
#
# Example:
# @CODE
# JUCE_VERSION=6.0.4
# @CODE

# @ECLASS_VARIABLE: PROJUCER_VERSION
# @DESCRIPTION:
# Choose a specific version of JUCE to use. A project may only build with older
# versions of JUCE.
: ${PROJUCER_VERSION="${JUCE_VERSION}"}

# @ECLASS_VARIABLE: JUCE_PATH
# @DESCRIPTION:
# The path to JUCE
: ${JUCE_PATH:="/opt/juce-${JUCE_VERSION}"}

# @ECLASS_VARIABLE: JUCE_MODULES_PATH
# @DESCRIPTION:
# The path to JUCE modules
: ${JUCE_MODULES_PATH:="${JUCE_PATH}/modules"}

# @ECLASS_VARIABLE: PROJUCER
# @DESCRIPTION:
# Provided in case someone wants to use a different binary
: ${PROJUCER:="/opt/juce-${PROJUCER_VERSION}/Projucer"}

# @ECLASS_VARIABLE: PROJUCER_CONF
# @INTERNAL
# @DESCRIPTION:
# Config file affected by the eclass. Projucer itself doesn't care
: ${PROJUCER_CONF:="${HOME}/.config/Projucer/Projucer.settings"}

# @FUNCTION: _projucer_update_paths
# @USAGE: <project>
# @INTERNAL
# @DESCRIPTION:
# Sets the proper paths in the project and Projucer
_projucer_update_paths() {
	# Update project
	sed -i "s/path=\".*\"\/>/path=\"${JUCE_MODULES_PATH//\//\\/}\"\/>/g" "${1}"
	# Generate config (This is fine since ebuilds have a temporary homedir)
	${PROJUCER} --help > /dev/null
	sed -i "s/<PROJECT_DEFAULT_SETTINGS\/>/<PROJECT_DEFAULT_SETTINGS jucePath=\"${JUCE_PATH//\//\\/}\" defaultJuceModulePath=\"${JUCE_MODULES_PATH//\//\\/}\"\/>/g" "${PROJUCER_CONF}"
}

# @FUNCTION: projucer_resave
# @USAGE: <project>
# @DESCRIPTION:
# Resave all project files and resources
projucer_resave() {
	_projucer_update_paths "${1}"
	${PROJUCER} --resave "${1}"
}
