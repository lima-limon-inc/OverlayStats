# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP17=setuptools
PYTHON_COMPAT=( python3_{9..10} )
# We do not use `git-r3` eclass because GitHub allows us
# to download the archive for a specific commit directly.
# If you want to change this ebuild to use `git-r3` eclass,
# remember to remove the package archive from SRC_URI
# and to update the definition of ${S} below.
GIT_COMMIT=d574f84079c2469b71e6c09c4b804e8bf6156153
inherit distutils-r1

DESCRIPTION="A plugin-based Matrix bot system."
HOMEPAGE="https://github.com/maubot/maubot"
SRC_URI="
	https://github.com/maubot/maubot/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://registry.yarnpkg.com/@ampproject/remapping/-/remapping-2.1.2.tgz -> @ampproject-remapping-2.1.2.tgz
	https://registry.yarnpkg.com/@apideck/better-ajv-errors/-/better-ajv-errors-0.3.3.tgz -> @apideck-better-ajv-errors-0.3.3.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.16.7.tgz -> @babel-code-frame-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/compat-data/-/compat-data-7.17.7.tgz -> @babel-compat-data-7.17.7.tgz
	https://registry.yarnpkg.com/@babel/core/-/core-7.17.8.tgz -> @babel-core-7.17.8.tgz
	https://registry.yarnpkg.com/@babel/eslint-parser/-/eslint-parser-7.17.0.tgz -> @babel-eslint-parser-7.17.0.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.17.7.tgz -> @babel-generator-7.17.7.tgz
	https://registry.yarnpkg.com/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.16.7.tgz -> @babel-helper-annotate-as-pure-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-builder-binary-assignment-operator-visitor/-/helper-builder-binary-assignment-operator-visitor-7.16.7.tgz -> @babel-helper-builder-binary-assignment-operator-visitor-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-compilation-targets/-/helper-compilation-targets-7.17.7.tgz -> @babel-helper-compilation-targets-7.17.7.tgz
	https://registry.yarnpkg.com/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.17.6.tgz -> @babel-helper-create-class-features-plugin-7.17.6.tgz
	https://registry.yarnpkg.com/@babel/helper-create-regexp-features-plugin/-/helper-create-regexp-features-plugin-7.17.0.tgz -> @babel-helper-create-regexp-features-plugin-7.17.0.tgz
	https://registry.yarnpkg.com/@babel/helper-define-polyfill-provider/-/helper-define-polyfill-provider-0.3.1.tgz -> @babel-helper-define-polyfill-provider-0.3.1.tgz
	https://registry.yarnpkg.com/@babel/helper-environment-visitor/-/helper-environment-visitor-7.16.7.tgz -> @babel-helper-environment-visitor-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-explode-assignable-expression/-/helper-explode-assignable-expression-7.16.7.tgz -> @babel-helper-explode-assignable-expression-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.16.7.tgz -> @babel-helper-function-name-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-get-function-arity/-/helper-get-function-arity-7.16.7.tgz -> @babel-helper-get-function-arity-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-hoist-variables/-/helper-hoist-variables-7.16.7.tgz -> @babel-helper-hoist-variables-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.17.7.tgz -> @babel-helper-member-expression-to-functions-7.17.7.tgz
	https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.16.7.tgz -> @babel-helper-module-imports-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-module-transforms/-/helper-module-transforms-7.17.7.tgz -> @babel-helper-module-transforms-7.17.7.tgz
	https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.16.7.tgz -> @babel-helper-optimise-call-expression-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.16.7.tgz -> @babel-helper-plugin-utils-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-remap-async-to-generator/-/helper-remap-async-to-generator-7.16.8.tgz -> @babel-helper-remap-async-to-generator-7.16.8.tgz
	https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.16.7.tgz -> @babel-helper-replace-supers-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-simple-access/-/helper-simple-access-7.17.7.tgz -> @babel-helper-simple-access-7.17.7.tgz
	https://registry.yarnpkg.com/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.16.0.tgz -> @babel-helper-skip-transparent-expression-wrappers-7.16.0.tgz
	https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.16.7.tgz -> @babel-helper-split-export-declaration-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.16.7.tgz -> @babel-helper-validator-identifier-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-option/-/helper-validator-option-7.16.7.tgz -> @babel-helper-validator-option-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-wrap-function/-/helper-wrap-function-7.16.8.tgz -> @babel-helper-wrap-function-7.16.8.tgz
	https://registry.yarnpkg.com/@babel/helpers/-/helpers-7.17.8.tgz -> @babel-helpers-7.17.8.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.16.10.tgz -> @babel-highlight-7.16.10.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.17.8.tgz -> @babel-parser-7.17.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression/-/plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.16.7.tgz -> @babel-plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining/-/plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.16.7.tgz -> @babel-plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-async-generator-functions/-/plugin-proposal-async-generator-functions-7.16.8.tgz -> @babel-plugin-proposal-async-generator-functions-7.16.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-class-properties/-/plugin-proposal-class-properties-7.16.7.tgz -> @babel-plugin-proposal-class-properties-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-class-static-block/-/plugin-proposal-class-static-block-7.17.6.tgz -> @babel-plugin-proposal-class-static-block-7.17.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-decorators/-/plugin-proposal-decorators-7.17.8.tgz -> @babel-plugin-proposal-decorators-7.17.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-dynamic-import/-/plugin-proposal-dynamic-import-7.16.7.tgz -> @babel-plugin-proposal-dynamic-import-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-export-namespace-from/-/plugin-proposal-export-namespace-from-7.16.7.tgz -> @babel-plugin-proposal-export-namespace-from-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-json-strings/-/plugin-proposal-json-strings-7.16.7.tgz -> @babel-plugin-proposal-json-strings-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-logical-assignment-operators/-/plugin-proposal-logical-assignment-operators-7.16.7.tgz -> @babel-plugin-proposal-logical-assignment-operators-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-nullish-coalescing-operator/-/plugin-proposal-nullish-coalescing-operator-7.16.7.tgz -> @babel-plugin-proposal-nullish-coalescing-operator-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-numeric-separator/-/plugin-proposal-numeric-separator-7.16.7.tgz -> @babel-plugin-proposal-numeric-separator-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-object-rest-spread/-/plugin-proposal-object-rest-spread-7.17.3.tgz -> @babel-plugin-proposal-object-rest-spread-7.17.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-optional-catch-binding/-/plugin-proposal-optional-catch-binding-7.16.7.tgz -> @babel-plugin-proposal-optional-catch-binding-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-optional-chaining/-/plugin-proposal-optional-chaining-7.16.7.tgz -> @babel-plugin-proposal-optional-chaining-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-private-methods/-/plugin-proposal-private-methods-7.16.11.tgz -> @babel-plugin-proposal-private-methods-7.16.11.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-private-property-in-object/-/plugin-proposal-private-property-in-object-7.16.7.tgz -> @babel-plugin-proposal-private-property-in-object-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-unicode-property-regex/-/plugin-proposal-unicode-property-regex-7.16.7.tgz -> @babel-plugin-proposal-unicode-property-regex-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-async-generators/-/plugin-syntax-async-generators-7.8.4.tgz -> @babel-plugin-syntax-async-generators-7.8.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-bigint/-/plugin-syntax-bigint-7.8.3.tgz -> @babel-plugin-syntax-bigint-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-class-properties/-/plugin-syntax-class-properties-7.12.13.tgz -> @babel-plugin-syntax-class-properties-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-class-static-block/-/plugin-syntax-class-static-block-7.14.5.tgz -> @babel-plugin-syntax-class-static-block-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-decorators/-/plugin-syntax-decorators-7.17.0.tgz -> @babel-plugin-syntax-decorators-7.17.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-dynamic-import/-/plugin-syntax-dynamic-import-7.8.3.tgz -> @babel-plugin-syntax-dynamic-import-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-export-namespace-from/-/plugin-syntax-export-namespace-from-7.8.3.tgz -> @babel-plugin-syntax-export-namespace-from-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-flow/-/plugin-syntax-flow-7.16.7.tgz -> @babel-plugin-syntax-flow-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-meta/-/plugin-syntax-import-meta-7.10.4.tgz -> @babel-plugin-syntax-import-meta-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-json-strings/-/plugin-syntax-json-strings-7.8.3.tgz -> @babel-plugin-syntax-json-strings-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.16.7.tgz -> @babel-plugin-syntax-jsx-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-logical-assignment-operators/-/plugin-syntax-logical-assignment-operators-7.10.4.tgz -> @babel-plugin-syntax-logical-assignment-operators-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-nullish-coalescing-operator/-/plugin-syntax-nullish-coalescing-operator-7.8.3.tgz -> @babel-plugin-syntax-nullish-coalescing-operator-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-numeric-separator/-/plugin-syntax-numeric-separator-7.10.4.tgz -> @babel-plugin-syntax-numeric-separator-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-object-rest-spread/-/plugin-syntax-object-rest-spread-7.8.3.tgz -> @babel-plugin-syntax-object-rest-spread-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-optional-catch-binding/-/plugin-syntax-optional-catch-binding-7.8.3.tgz -> @babel-plugin-syntax-optional-catch-binding-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-optional-chaining/-/plugin-syntax-optional-chaining-7.8.3.tgz -> @babel-plugin-syntax-optional-chaining-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-private-property-in-object/-/plugin-syntax-private-property-in-object-7.14.5.tgz -> @babel-plugin-syntax-private-property-in-object-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-top-level-await/-/plugin-syntax-top-level-await-7.14.5.tgz -> @babel-plugin-syntax-top-level-await-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-typescript/-/plugin-syntax-typescript-7.16.7.tgz -> @babel-plugin-syntax-typescript-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-arrow-functions/-/plugin-transform-arrow-functions-7.16.7.tgz -> @babel-plugin-transform-arrow-functions-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-async-to-generator/-/plugin-transform-async-to-generator-7.16.8.tgz -> @babel-plugin-transform-async-to-generator-7.16.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoped-functions/-/plugin-transform-block-scoped-functions-7.16.7.tgz -> @babel-plugin-transform-block-scoped-functions-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoping/-/plugin-transform-block-scoping-7.16.7.tgz -> @babel-plugin-transform-block-scoping-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-classes/-/plugin-transform-classes-7.16.7.tgz -> @babel-plugin-transform-classes-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-computed-properties/-/plugin-transform-computed-properties-7.16.7.tgz -> @babel-plugin-transform-computed-properties-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-destructuring/-/plugin-transform-destructuring-7.17.7.tgz -> @babel-plugin-transform-destructuring-7.17.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-dotall-regex/-/plugin-transform-dotall-regex-7.16.7.tgz -> @babel-plugin-transform-dotall-regex-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-duplicate-keys/-/plugin-transform-duplicate-keys-7.16.7.tgz -> @babel-plugin-transform-duplicate-keys-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-exponentiation-operator/-/plugin-transform-exponentiation-operator-7.16.7.tgz -> @babel-plugin-transform-exponentiation-operator-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-flow-strip-types/-/plugin-transform-flow-strip-types-7.16.7.tgz -> @babel-plugin-transform-flow-strip-types-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-for-of/-/plugin-transform-for-of-7.16.7.tgz -> @babel-plugin-transform-for-of-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-function-name/-/plugin-transform-function-name-7.16.7.tgz -> @babel-plugin-transform-function-name-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-literals/-/plugin-transform-literals-7.16.7.tgz -> @babel-plugin-transform-literals-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-member-expression-literals/-/plugin-transform-member-expression-literals-7.16.7.tgz -> @babel-plugin-transform-member-expression-literals-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-amd/-/plugin-transform-modules-amd-7.16.7.tgz -> @babel-plugin-transform-modules-amd-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-commonjs/-/plugin-transform-modules-commonjs-7.17.7.tgz -> @babel-plugin-transform-modules-commonjs-7.17.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-systemjs/-/plugin-transform-modules-systemjs-7.17.8.tgz -> @babel-plugin-transform-modules-systemjs-7.17.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-umd/-/plugin-transform-modules-umd-7.16.7.tgz -> @babel-plugin-transform-modules-umd-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-named-capturing-groups-regex/-/plugin-transform-named-capturing-groups-regex-7.16.8.tgz -> @babel-plugin-transform-named-capturing-groups-regex-7.16.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-new-target/-/plugin-transform-new-target-7.16.7.tgz -> @babel-plugin-transform-new-target-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-object-super/-/plugin-transform-object-super-7.16.7.tgz -> @babel-plugin-transform-object-super-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-parameters/-/plugin-transform-parameters-7.16.7.tgz -> @babel-plugin-transform-parameters-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-property-literals/-/plugin-transform-property-literals-7.16.7.tgz -> @babel-plugin-transform-property-literals-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-constant-elements/-/plugin-transform-react-constant-elements-7.17.6.tgz -> @babel-plugin-transform-react-constant-elements-7.17.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-display-name/-/plugin-transform-react-display-name-7.16.7.tgz -> @babel-plugin-transform-react-display-name-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-jsx-development/-/plugin-transform-react-jsx-development-7.16.7.tgz -> @babel-plugin-transform-react-jsx-development-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-jsx/-/plugin-transform-react-jsx-7.17.3.tgz -> @babel-plugin-transform-react-jsx-7.17.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-pure-annotations/-/plugin-transform-react-pure-annotations-7.16.7.tgz -> @babel-plugin-transform-react-pure-annotations-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-regenerator/-/plugin-transform-regenerator-7.16.7.tgz -> @babel-plugin-transform-regenerator-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-reserved-words/-/plugin-transform-reserved-words-7.16.7.tgz -> @babel-plugin-transform-reserved-words-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-runtime/-/plugin-transform-runtime-7.17.0.tgz -> @babel-plugin-transform-runtime-7.17.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-shorthand-properties/-/plugin-transform-shorthand-properties-7.16.7.tgz -> @babel-plugin-transform-shorthand-properties-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-spread/-/plugin-transform-spread-7.16.7.tgz -> @babel-plugin-transform-spread-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-sticky-regex/-/plugin-transform-sticky-regex-7.16.7.tgz -> @babel-plugin-transform-sticky-regex-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-template-literals/-/plugin-transform-template-literals-7.16.7.tgz -> @babel-plugin-transform-template-literals-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typeof-symbol/-/plugin-transform-typeof-symbol-7.16.7.tgz -> @babel-plugin-transform-typeof-symbol-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typescript/-/plugin-transform-typescript-7.16.8.tgz -> @babel-plugin-transform-typescript-7.16.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-escapes/-/plugin-transform-unicode-escapes-7.16.7.tgz -> @babel-plugin-transform-unicode-escapes-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-regex/-/plugin-transform-unicode-regex-7.16.7.tgz -> @babel-plugin-transform-unicode-regex-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/preset-env/-/preset-env-7.16.11.tgz -> @babel-preset-env-7.16.11.tgz
	https://registry.yarnpkg.com/@babel/preset-modules/-/preset-modules-0.1.5.tgz -> @babel-preset-modules-0.1.5.tgz
	https://registry.yarnpkg.com/@babel/preset-react/-/preset-react-7.16.7.tgz -> @babel-preset-react-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/preset-typescript/-/preset-typescript-7.16.7.tgz -> @babel-preset-typescript-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/runtime-corejs3/-/runtime-corejs3-7.17.8.tgz -> @babel-runtime-corejs3-7.17.8.tgz
	https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.17.8.tgz -> @babel-runtime-7.17.8.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.16.7.tgz -> @babel-template-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.17.3.tgz -> @babel-traverse-7.17.3.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.17.0.tgz -> @babel-types-7.17.0.tgz
	https://registry.yarnpkg.com/@bcoe/v8-coverage/-/v8-coverage-0.2.3.tgz -> @bcoe-v8-coverage-0.2.3.tgz
	https://registry.yarnpkg.com/@csstools/normalize.css/-/normalize.css-12.0.0.tgz -> @csstools-normalize.css-12.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-color-function/-/postcss-color-function-1.0.3.tgz -> @csstools-postcss-color-function-1.0.3.tgz
	https://registry.yarnpkg.com/@csstools/postcss-font-format-keywords/-/postcss-font-format-keywords-1.0.0.tgz -> @csstools-postcss-font-format-keywords-1.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-hwb-function/-/postcss-hwb-function-1.0.0.tgz -> @csstools-postcss-hwb-function-1.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-ic-unit/-/postcss-ic-unit-1.0.0.tgz -> @csstools-postcss-ic-unit-1.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-is-pseudo-class/-/postcss-is-pseudo-class-2.0.1.tgz -> @csstools-postcss-is-pseudo-class-2.0.1.tgz
	https://registry.yarnpkg.com/@csstools/postcss-normalize-display-values/-/postcss-normalize-display-values-1.0.0.tgz -> @csstools-postcss-normalize-display-values-1.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-oklab-function/-/postcss-oklab-function-1.0.2.tgz -> @csstools-postcss-oklab-function-1.0.2.tgz
	https://registry.yarnpkg.com/@csstools/postcss-progressive-custom-properties/-/postcss-progressive-custom-properties-1.3.0.tgz -> @csstools-postcss-progressive-custom-properties-1.3.0.tgz
	https://registry.yarnpkg.com/@emotion/babel-plugin/-/babel-plugin-11.7.2.tgz -> @emotion-babel-plugin-11.7.2.tgz
	https://registry.yarnpkg.com/@emotion/cache/-/cache-11.7.1.tgz -> @emotion-cache-11.7.1.tgz
	https://registry.yarnpkg.com/@emotion/hash/-/hash-0.8.0.tgz -> @emotion-hash-0.8.0.tgz
	https://registry.yarnpkg.com/@emotion/memoize/-/memoize-0.7.5.tgz -> @emotion-memoize-0.7.5.tgz
	https://registry.yarnpkg.com/@emotion/react/-/react-11.8.2.tgz -> @emotion-react-11.8.2.tgz
	https://registry.yarnpkg.com/@emotion/serialize/-/serialize-1.0.2.tgz -> @emotion-serialize-1.0.2.tgz
	https://registry.yarnpkg.com/@emotion/sheet/-/sheet-1.1.0.tgz -> @emotion-sheet-1.1.0.tgz
	https://registry.yarnpkg.com/@emotion/unitless/-/unitless-0.7.5.tgz -> @emotion-unitless-0.7.5.tgz
	https://registry.yarnpkg.com/@emotion/utils/-/utils-1.1.0.tgz -> @emotion-utils-1.1.0.tgz
	https://registry.yarnpkg.com/@emotion/weak-memoize/-/weak-memoize-0.2.5.tgz -> @emotion-weak-memoize-0.2.5.tgz
	https://registry.yarnpkg.com/@eslint/eslintrc/-/eslintrc-1.2.1.tgz -> @eslint-eslintrc-1.2.1.tgz
	https://registry.yarnpkg.com/@humanwhocodes/config-array/-/config-array-0.9.5.tgz -> @humanwhocodes-config-array-0.9.5.tgz
	https://registry.yarnpkg.com/@humanwhocodes/object-schema/-/object-schema-1.2.1.tgz -> @humanwhocodes-object-schema-1.2.1.tgz
	https://registry.yarnpkg.com/@istanbuljs/load-nyc-config/-/load-nyc-config-1.1.0.tgz -> @istanbuljs-load-nyc-config-1.1.0.tgz
	https://registry.yarnpkg.com/@istanbuljs/schema/-/schema-0.1.3.tgz -> @istanbuljs-schema-0.1.3.tgz
	https://registry.yarnpkg.com/@jest/console/-/console-27.5.1.tgz -> @jest-console-27.5.1.tgz
	https://registry.yarnpkg.com/@jest/core/-/core-27.5.1.tgz -> @jest-core-27.5.1.tgz
	https://registry.yarnpkg.com/@jest/environment/-/environment-27.5.1.tgz -> @jest-environment-27.5.1.tgz
	https://registry.yarnpkg.com/@jest/fake-timers/-/fake-timers-27.5.1.tgz -> @jest-fake-timers-27.5.1.tgz
	https://registry.yarnpkg.com/@jest/globals/-/globals-27.5.1.tgz -> @jest-globals-27.5.1.tgz
	https://registry.yarnpkg.com/@jest/reporters/-/reporters-27.5.1.tgz -> @jest-reporters-27.5.1.tgz
	https://registry.yarnpkg.com/@jest/source-map/-/source-map-27.5.1.tgz -> @jest-source-map-27.5.1.tgz
	https://registry.yarnpkg.com/@jest/test-result/-/test-result-27.5.1.tgz -> @jest-test-result-27.5.1.tgz
	https://registry.yarnpkg.com/@jest/test-sequencer/-/test-sequencer-27.5.1.tgz -> @jest-test-sequencer-27.5.1.tgz
	https://registry.yarnpkg.com/@jest/transform/-/transform-27.5.1.tgz -> @jest-transform-27.5.1.tgz
	https://registry.yarnpkg.com/@jest/types/-/types-27.5.1.tgz -> @jest-types-27.5.1.tgz
	https://registry.yarnpkg.com/@jridgewell/resolve-uri/-/resolve-uri-3.0.5.tgz -> @jridgewell-resolve-uri-3.0.5.tgz
	https://registry.yarnpkg.com/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.4.11.tgz -> @jridgewell-sourcemap-codec-1.4.11.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.4.tgz -> @jridgewell-trace-mapping-0.3.4.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz -> @nodelib-fs.scandir-2.1.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz -> @nodelib-fs.stat-2.0.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz -> @nodelib-fs.walk-1.2.8.tgz
	https://registry.yarnpkg.com/@pmmmwh/react-refresh-webpack-plugin/-/react-refresh-webpack-plugin-0.5.4.tgz -> @pmmmwh-react-refresh-webpack-plugin-0.5.4.tgz
	https://registry.yarnpkg.com/@rollup/plugin-babel/-/plugin-babel-5.3.1.tgz -> @rollup-plugin-babel-5.3.1.tgz
	https://registry.yarnpkg.com/@rollup/plugin-node-resolve/-/plugin-node-resolve-11.2.1.tgz -> @rollup-plugin-node-resolve-11.2.1.tgz
	https://registry.yarnpkg.com/@rollup/plugin-replace/-/plugin-replace-2.4.2.tgz -> @rollup-plugin-replace-2.4.2.tgz
	https://registry.yarnpkg.com/@rollup/pluginutils/-/pluginutils-3.1.0.tgz -> @rollup-pluginutils-3.1.0.tgz
	https://registry.yarnpkg.com/@rushstack/eslint-patch/-/eslint-patch-1.1.1.tgz -> @rushstack-eslint-patch-1.1.1.tgz
	https://registry.yarnpkg.com/@sinonjs/commons/-/commons-1.8.3.tgz -> @sinonjs-commons-1.8.3.tgz
	https://registry.yarnpkg.com/@sinonjs/fake-timers/-/fake-timers-8.1.0.tgz -> @sinonjs-fake-timers-8.1.0.tgz
	https://registry.yarnpkg.com/@surma/rollup-plugin-off-main-thread/-/rollup-plugin-off-main-thread-2.2.3.tgz -> @surma-rollup-plugin-off-main-thread-2.2.3.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-add-jsx-attribute/-/babel-plugin-add-jsx-attribute-5.4.0.tgz -> @svgr-babel-plugin-add-jsx-attribute-5.4.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-attribute/-/babel-plugin-remove-jsx-attribute-5.4.0.tgz -> @svgr-babel-plugin-remove-jsx-attribute-5.4.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-empty-expression/-/babel-plugin-remove-jsx-empty-expression-5.0.1.tgz -> @svgr-babel-plugin-remove-jsx-empty-expression-5.0.1.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-replace-jsx-attribute-value/-/babel-plugin-replace-jsx-attribute-value-5.0.1.tgz -> @svgr-babel-plugin-replace-jsx-attribute-value-5.0.1.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-svg-dynamic-title/-/babel-plugin-svg-dynamic-title-5.4.0.tgz -> @svgr-babel-plugin-svg-dynamic-title-5.4.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-svg-em-dimensions/-/babel-plugin-svg-em-dimensions-5.4.0.tgz -> @svgr-babel-plugin-svg-em-dimensions-5.4.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-transform-react-native-svg/-/babel-plugin-transform-react-native-svg-5.4.0.tgz -> @svgr-babel-plugin-transform-react-native-svg-5.4.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-transform-svg-component/-/babel-plugin-transform-svg-component-5.5.0.tgz -> @svgr-babel-plugin-transform-svg-component-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-preset/-/babel-preset-5.5.0.tgz -> @svgr-babel-preset-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/core/-/core-5.5.0.tgz -> @svgr-core-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/hast-util-to-babel-ast/-/hast-util-to-babel-ast-5.5.0.tgz -> @svgr-hast-util-to-babel-ast-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/plugin-jsx/-/plugin-jsx-5.5.0.tgz -> @svgr-plugin-jsx-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/plugin-svgo/-/plugin-svgo-5.5.0.tgz -> @svgr-plugin-svgo-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/webpack/-/webpack-5.5.0.tgz -> @svgr-webpack-5.5.0.tgz
	https://registry.yarnpkg.com/@tootallnate/once/-/once-1.1.2.tgz -> @tootallnate-once-1.1.2.tgz
	https://registry.yarnpkg.com/@trysound/sax/-/sax-0.2.0.tgz -> @trysound-sax-0.2.0.tgz
	https://registry.yarnpkg.com/@types/babel__core/-/babel__core-7.1.19.tgz -> @types-babel__core-7.1.19.tgz
	https://registry.yarnpkg.com/@types/babel__generator/-/babel__generator-7.6.4.tgz -> @types-babel__generator-7.6.4.tgz
	https://registry.yarnpkg.com/@types/babel__template/-/babel__template-7.4.1.tgz -> @types-babel__template-7.4.1.tgz
	https://registry.yarnpkg.com/@types/babel__traverse/-/babel__traverse-7.14.2.tgz -> @types-babel__traverse-7.14.2.tgz
	https://registry.yarnpkg.com/@types/base16/-/base16-1.0.2.tgz -> @types-base16-1.0.2.tgz
	https://registry.yarnpkg.com/@types/body-parser/-/body-parser-1.19.2.tgz -> @types-body-parser-1.19.2.tgz
	https://registry.yarnpkg.com/@types/bonjour/-/bonjour-3.5.10.tgz -> @types-bonjour-3.5.10.tgz
	https://registry.yarnpkg.com/@types/connect-history-api-fallback/-/connect-history-api-fallback-1.3.5.tgz -> @types-connect-history-api-fallback-1.3.5.tgz
	https://registry.yarnpkg.com/@types/connect/-/connect-3.4.35.tgz -> @types-connect-3.4.35.tgz
	https://registry.yarnpkg.com/@types/eslint-scope/-/eslint-scope-3.7.3.tgz -> @types-eslint-scope-3.7.3.tgz
	https://registry.yarnpkg.com/@types/eslint/-/eslint-8.4.1.tgz -> @types-eslint-8.4.1.tgz
	https://registry.yarnpkg.com/@types/eslint/-/eslint-7.29.0.tgz -> @types-eslint-7.29.0.tgz
	https://registry.yarnpkg.com/@types/estree/-/estree-0.0.51.tgz -> @types-estree-0.0.51.tgz
	https://registry.yarnpkg.com/@types/estree/-/estree-0.0.39.tgz -> @types-estree-0.0.39.tgz
	https://registry.yarnpkg.com/@types/express-serve-static-core/-/express-serve-static-core-4.17.28.tgz -> @types-express-serve-static-core-4.17.28.tgz
	https://registry.yarnpkg.com/@types/express/-/express-4.17.13.tgz -> @types-express-4.17.13.tgz
	https://registry.yarnpkg.com/@types/graceful-fs/-/graceful-fs-4.1.5.tgz -> @types-graceful-fs-4.1.5.tgz
	https://registry.yarnpkg.com/@types/html-minifier-terser/-/html-minifier-terser-6.1.0.tgz -> @types-html-minifier-terser-6.1.0.tgz
	https://registry.yarnpkg.com/@types/http-proxy/-/http-proxy-1.17.8.tgz -> @types-http-proxy-1.17.8.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.4.tgz -> @types-istanbul-lib-coverage-2.0.4.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-report/-/istanbul-lib-report-3.0.0.tgz -> @types-istanbul-lib-report-3.0.0.tgz
	https://registry.yarnpkg.com/@types/istanbul-reports/-/istanbul-reports-3.0.1.tgz -> @types-istanbul-reports-3.0.1.tgz
	https://registry.yarnpkg.com/@types/json-schema/-/json-schema-7.0.11.tgz -> @types-json-schema-7.0.11.tgz
	https://registry.yarnpkg.com/@types/json5/-/json5-0.0.29.tgz -> @types-json5-0.0.29.tgz
	https://registry.yarnpkg.com/@types/lodash/-/lodash-4.14.180.tgz -> @types-lodash-4.14.180.tgz
	https://registry.yarnpkg.com/@types/mime/-/mime-1.3.2.tgz -> @types-mime-1.3.2.tgz
	https://registry.yarnpkg.com/@types/node/-/node-17.0.23.tgz -> @types-node-17.0.23.tgz
	https://registry.yarnpkg.com/@types/parse-json/-/parse-json-4.0.0.tgz -> @types-parse-json-4.0.0.tgz
	https://registry.yarnpkg.com/@types/prettier/-/prettier-2.4.4.tgz -> @types-prettier-2.4.4.tgz
	https://registry.yarnpkg.com/@types/prop-types/-/prop-types-15.7.4.tgz -> @types-prop-types-15.7.4.tgz
	https://registry.yarnpkg.com/@types/q/-/q-1.5.5.tgz -> @types-q-1.5.5.tgz
	https://registry.yarnpkg.com/@types/qs/-/qs-6.9.7.tgz -> @types-qs-6.9.7.tgz
	https://registry.yarnpkg.com/@types/range-parser/-/range-parser-1.2.4.tgz -> @types-range-parser-1.2.4.tgz
	https://registry.yarnpkg.com/@types/react-transition-group/-/react-transition-group-4.4.4.tgz -> @types-react-transition-group-4.4.4.tgz
	https://registry.yarnpkg.com/@types/react/-/react-17.0.43.tgz -> @types-react-17.0.43.tgz
	https://registry.yarnpkg.com/@types/resolve/-/resolve-1.17.1.tgz -> @types-resolve-1.17.1.tgz
	https://registry.yarnpkg.com/@types/retry/-/retry-0.12.1.tgz -> @types-retry-0.12.1.tgz
	https://registry.yarnpkg.com/@types/scheduler/-/scheduler-0.16.2.tgz -> @types-scheduler-0.16.2.tgz
	https://registry.yarnpkg.com/@types/serve-index/-/serve-index-1.9.1.tgz -> @types-serve-index-1.9.1.tgz
	https://registry.yarnpkg.com/@types/serve-static/-/serve-static-1.13.10.tgz -> @types-serve-static-1.13.10.tgz
	https://registry.yarnpkg.com/@types/sockjs/-/sockjs-0.3.33.tgz -> @types-sockjs-0.3.33.tgz
	https://registry.yarnpkg.com/@types/stack-utils/-/stack-utils-2.0.1.tgz -> @types-stack-utils-2.0.1.tgz
	https://registry.yarnpkg.com/@types/trusted-types/-/trusted-types-2.0.2.tgz -> @types-trusted-types-2.0.2.tgz
	https://registry.yarnpkg.com/@types/ws/-/ws-8.5.3.tgz -> @types-ws-8.5.3.tgz
	https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-21.0.0.tgz -> @types-yargs-parser-21.0.0.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-16.0.4.tgz -> @types-yargs-16.0.4.tgz
	https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-5.16.0.tgz -> @typescript-eslint-eslint-plugin-5.16.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/experimental-utils/-/experimental-utils-5.16.0.tgz -> @typescript-eslint-experimental-utils-5.16.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-5.16.0.tgz -> @typescript-eslint-parser-5.16.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-5.16.0.tgz -> @typescript-eslint-scope-manager-5.16.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/type-utils/-/type-utils-5.16.0.tgz -> @typescript-eslint-type-utils-5.16.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-5.16.0.tgz -> @typescript-eslint-types-5.16.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-5.16.0.tgz -> @typescript-eslint-typescript-estree-5.16.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-5.16.0.tgz -> @typescript-eslint-utils-5.16.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-5.16.0.tgz -> @typescript-eslint-visitor-keys-5.16.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ast/-/ast-1.11.1.tgz -> @webassemblyjs-ast-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.11.1.tgz -> @webassemblyjs-floating-point-hex-parser-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-api-error/-/helper-api-error-1.11.1.tgz -> @webassemblyjs-helper-api-error-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-buffer/-/helper-buffer-1.11.1.tgz -> @webassemblyjs-helper-buffer-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-numbers/-/helper-numbers-1.11.1.tgz -> @webassemblyjs-helper-numbers-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.11.1.tgz -> @webassemblyjs-helper-wasm-bytecode-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.11.1.tgz -> @webassemblyjs-helper-wasm-section-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ieee754/-/ieee754-1.11.1.tgz -> @webassemblyjs-ieee754-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/leb128/-/leb128-1.11.1.tgz -> @webassemblyjs-leb128-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/utf8/-/utf8-1.11.1.tgz -> @webassemblyjs-utf8-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-edit/-/wasm-edit-1.11.1.tgz -> @webassemblyjs-wasm-edit-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-gen/-/wasm-gen-1.11.1.tgz -> @webassemblyjs-wasm-gen-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-opt/-/wasm-opt-1.11.1.tgz -> @webassemblyjs-wasm-opt-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-parser/-/wasm-parser-1.11.1.tgz -> @webassemblyjs-wasm-parser-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wast-printer/-/wast-printer-1.11.1.tgz -> @webassemblyjs-wast-printer-1.11.1.tgz
	https://registry.yarnpkg.com/@xtuc/ieee754/-/ieee754-1.2.0.tgz -> @xtuc-ieee754-1.2.0.tgz
	https://registry.yarnpkg.com/@xtuc/long/-/long-4.2.2.tgz -> @xtuc-long-4.2.2.tgz
	https://registry.yarnpkg.com/abab/-/abab-2.0.5.tgz
	https://registry.yarnpkg.com/accepts/-/accepts-1.3.8.tgz
	https://registry.yarnpkg.com/ace-builds/-/ace-builds-1.4.14.tgz
	https://registry.yarnpkg.com/acorn-globals/-/acorn-globals-6.0.0.tgz
	https://registry.yarnpkg.com/acorn-import-assertions/-/acorn-import-assertions-1.8.0.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.3.2.tgz
	https://registry.yarnpkg.com/acorn-node/-/acorn-node-1.8.2.tgz
	https://registry.yarnpkg.com/acorn-walk/-/acorn-walk-7.2.0.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-7.4.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.7.0.tgz
	https://registry.yarnpkg.com/address/-/address-1.1.2.tgz
	https://registry.yarnpkg.com/adjust-sourcemap-loader/-/adjust-sourcemap-loader-4.0.0.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-6.0.2.tgz
	https://registry.yarnpkg.com/aggregate-error/-/aggregate-error-3.1.0.tgz
	https://registry.yarnpkg.com/ajv-formats/-/ajv-formats-2.1.1.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.5.2.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-5.1.0.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.6.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-8.11.0.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-4.3.2.tgz
	https://registry.yarnpkg.com/ansi-html-community/-/ansi-html-community-0.0.8.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-6.0.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.3.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-5.2.0.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-3.1.2.tgz
	https://registry.yarnpkg.com/arg/-/arg-5.0.1.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-1.0.10.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-2.0.1.tgz
	https://registry.yarnpkg.com/aria-query/-/aria-query-4.2.2.tgz
	https://registry.yarnpkg.com/array-flatten/-/array-flatten-1.1.1.tgz
	https://registry.yarnpkg.com/array-flatten/-/array-flatten-2.1.2.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.4.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-2.1.0.tgz
	https://registry.yarnpkg.com/array.prototype.flat/-/array.prototype.flat-1.2.5.tgz
	https://registry.yarnpkg.com/array.prototype.flatmap/-/array.prototype.flatmap-1.2.5.tgz
	https://registry.yarnpkg.com/asap/-/asap-2.0.6.tgz
	https://registry.yarnpkg.com/ast-types-flow/-/ast-types-flow-0.0.7.tgz
	https://registry.yarnpkg.com/async/-/async-0.9.2.tgz
	https://registry.yarnpkg.com/async/-/async-2.6.3.tgz
	https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz
	https://registry.yarnpkg.com/at-least-node/-/at-least-node-1.0.0.tgz
	https://registry.yarnpkg.com/autoprefixer/-/autoprefixer-10.4.4.tgz
	https://registry.yarnpkg.com/axe-core/-/axe-core-4.4.1.tgz
	https://registry.yarnpkg.com/axobject-query/-/axobject-query-2.2.0.tgz
	https://registry.yarnpkg.com/babel-jest/-/babel-jest-27.5.1.tgz
	https://registry.yarnpkg.com/babel-loader/-/babel-loader-8.2.4.tgz
	https://registry.yarnpkg.com/babel-plugin-dynamic-import-node/-/babel-plugin-dynamic-import-node-2.3.3.tgz
	https://registry.yarnpkg.com/babel-plugin-istanbul/-/babel-plugin-istanbul-6.1.1.tgz
	https://registry.yarnpkg.com/babel-plugin-jest-hoist/-/babel-plugin-jest-hoist-27.5.1.tgz
	https://registry.yarnpkg.com/babel-plugin-macros/-/babel-plugin-macros-2.8.0.tgz
	https://registry.yarnpkg.com/babel-plugin-macros/-/babel-plugin-macros-3.1.0.tgz
	https://registry.yarnpkg.com/babel-plugin-named-asset-import/-/babel-plugin-named-asset-import-0.3.8.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs2/-/babel-plugin-polyfill-corejs2-0.3.1.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs3/-/babel-plugin-polyfill-corejs3-0.5.2.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-regenerator/-/babel-plugin-polyfill-regenerator-0.3.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-react-remove-prop-types/-/babel-plugin-transform-react-remove-prop-types-0.4.24.tgz
	https://registry.yarnpkg.com/babel-preset-current-node-syntax/-/babel-preset-current-node-syntax-1.0.1.tgz
	https://registry.yarnpkg.com/babel-preset-jest/-/babel-preset-jest-27.5.1.tgz
	https://registry.yarnpkg.com/babel-preset-react-app/-/babel-preset-react-app-10.0.1.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.2.tgz
	https://registry.yarnpkg.com/base16/-/base16-1.0.0.tgz
	https://registry.yarnpkg.com/batch/-/batch-0.6.1.tgz
	https://registry.yarnpkg.com/bfj/-/bfj-7.0.2.tgz
	https://registry.yarnpkg.com/big.js/-/big.js-5.2.2.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-2.2.0.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.7.2.tgz
	https://registry.yarnpkg.com/body-parser/-/body-parser-1.19.2.tgz
	https://registry.yarnpkg.com/bonjour/-/bonjour-3.5.0.tgz
	https://registry.yarnpkg.com/boolbase/-/boolbase-1.0.0.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.2.tgz
	https://registry.yarnpkg.com/browser-process-hrtime/-/browser-process-hrtime-1.0.0.tgz
	https://registry.yarnpkg.com/browserslist/-/browserslist-4.20.2.tgz
	https://registry.yarnpkg.com/bser/-/bser-2.1.1.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.2.tgz
	https://registry.yarnpkg.com/buffer-indexof/-/buffer-indexof-1.1.1.tgz
	https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-3.2.0.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-3.0.0.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-3.1.2.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.2.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-3.1.0.tgz
	https://registry.yarnpkg.com/camel-case/-/camel-case-4.1.2.tgz
	https://registry.yarnpkg.com/camelcase-css/-/camelcase-css-2.0.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-5.3.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-6.3.0.tgz
	https://registry.yarnpkg.com/caniuse-api/-/caniuse-api-3.0.0.tgz
	https://registry.yarnpkg.com/caniuse-lite/-/caniuse-lite-1.0.30001320.tgz
	https://registry.yarnpkg.com/case-sensitive-paths-webpack-plugin/-/case-sensitive-paths-webpack-plugin-2.4.0.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.2.tgz
	https://registry.yarnpkg.com/char-regex/-/char-regex-1.0.2.tgz
	https://registry.yarnpkg.com/char-regex/-/char-regex-2.0.1.tgz
	https://registry.yarnpkg.com/charcodes/-/charcodes-0.2.0.tgz
	https://registry.yarnpkg.com/check-types/-/check-types-11.1.2.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.5.3.tgz
	https://registry.yarnpkg.com/chrome-trace-event/-/chrome-trace-event-1.0.3.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-3.3.0.tgz
	https://registry.yarnpkg.com/cjs-module-lexer/-/cjs-module-lexer-1.2.2.tgz
	https://registry.yarnpkg.com/classnames/-/classnames-2.3.1.tgz
	https://registry.yarnpkg.com/clean-css/-/clean-css-5.2.4.tgz
	https://registry.yarnpkg.com/clean-stack/-/clean-stack-2.2.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-7.0.4.tgz
	https://registry.yarnpkg.com/co/-/co-4.6.0.tgz
	https://registry.yarnpkg.com/coa/-/coa-2.0.2.tgz
	https://registry.yarnpkg.com/collect-v8-coverage/-/collect-v8-coverage-1.0.1.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz
	https://registry.yarnpkg.com/color-string/-/color-string-1.9.0.tgz
	https://registry.yarnpkg.com/color/-/color-3.2.1.tgz
	https://registry.yarnpkg.com/colord/-/colord-2.9.2.tgz
	https://registry.yarnpkg.com/colorette/-/colorette-2.0.16.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.8.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.20.3.tgz
	https://registry.yarnpkg.com/commander/-/commander-7.2.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-8.3.0.tgz
	https://registry.yarnpkg.com/common-path-prefix/-/common-path-prefix-3.0.0.tgz
	https://registry.yarnpkg.com/common-tags/-/common-tags-1.8.2.tgz
	https://registry.yarnpkg.com/commondir/-/commondir-1.0.1.tgz
	https://registry.yarnpkg.com/compressible/-/compressible-2.0.18.tgz
	https://registry.yarnpkg.com/compression/-/compression-1.7.4.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/confusing-browser-globals/-/confusing-browser-globals-1.0.11.tgz
	https://registry.yarnpkg.com/connect-history-api-fallback/-/connect-history-api-fallback-1.6.0.tgz
	https://registry.yarnpkg.com/content-disposition/-/content-disposition-0.5.4.tgz
	https://registry.yarnpkg.com/content-type/-/content-type-1.0.4.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-1.8.0.tgz
	https://registry.yarnpkg.com/cookie-signature/-/cookie-signature-1.0.6.tgz
	https://registry.yarnpkg.com/cookie/-/cookie-0.4.2.tgz
	https://registry.yarnpkg.com/core-js-compat/-/core-js-compat-3.21.1.tgz
	https://registry.yarnpkg.com/core-js-pure/-/core-js-pure-3.21.1.tgz
	https://registry.yarnpkg.com/core-js/-/core-js-3.21.1.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.3.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-6.0.0.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-7.0.1.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.3.tgz
	https://registry.yarnpkg.com/crypto-random-string/-/crypto-random-string-2.0.0.tgz
	https://registry.yarnpkg.com/css-blank-pseudo/-/css-blank-pseudo-3.0.3.tgz
	https://registry.yarnpkg.com/css-declaration-sorter/-/css-declaration-sorter-6.1.4.tgz
	https://registry.yarnpkg.com/css-has-pseudo/-/css-has-pseudo-3.0.4.tgz
	https://registry.yarnpkg.com/css-loader/-/css-loader-6.7.1.tgz
	https://registry.yarnpkg.com/css-minimizer-webpack-plugin/-/css-minimizer-webpack-plugin-3.4.1.tgz
	https://registry.yarnpkg.com/css-prefers-color-scheme/-/css-prefers-color-scheme-6.0.3.tgz
	https://registry.yarnpkg.com/css-select-base-adapter/-/css-select-base-adapter-0.1.1.tgz
	https://registry.yarnpkg.com/css-select/-/css-select-2.1.0.tgz
	https://registry.yarnpkg.com/css-select/-/css-select-4.2.1.tgz
	https://registry.yarnpkg.com/css-tree/-/css-tree-1.0.0-alpha.37.tgz
	https://registry.yarnpkg.com/css-tree/-/css-tree-1.1.3.tgz
	https://registry.yarnpkg.com/css-what/-/css-what-3.4.2.tgz
	https://registry.yarnpkg.com/css-what/-/css-what-5.1.0.tgz
	https://registry.yarnpkg.com/cssdb/-/cssdb-6.5.0.tgz
	https://registry.yarnpkg.com/cssesc/-/cssesc-3.0.0.tgz
	https://registry.yarnpkg.com/cssnano-preset-default/-/cssnano-preset-default-5.2.5.tgz
	https://registry.yarnpkg.com/cssnano-utils/-/cssnano-utils-3.1.0.tgz
	https://registry.yarnpkg.com/cssnano/-/cssnano-5.1.5.tgz
	https://registry.yarnpkg.com/csso/-/csso-4.2.0.tgz
	https://registry.yarnpkg.com/cssom/-/cssom-0.4.4.tgz
	https://registry.yarnpkg.com/cssom/-/cssom-0.3.8.tgz
	https://registry.yarnpkg.com/cssstyle/-/cssstyle-2.3.0.tgz
	https://registry.yarnpkg.com/csstype/-/csstype-3.0.11.tgz
	https://registry.yarnpkg.com/damerau-levenshtein/-/damerau-levenshtein-1.0.8.tgz
	https://registry.yarnpkg.com/data-urls/-/data-urls-2.0.0.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.6.9.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.4.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.2.7.tgz
	https://registry.yarnpkg.com/decimal.js/-/decimal.js-10.3.1.tgz
	https://registry.yarnpkg.com/dedent/-/dedent-0.7.0.tgz
	https://registry.yarnpkg.com/deep-equal/-/deep-equal-1.1.1.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.4.tgz
	https://registry.yarnpkg.com/deepmerge/-/deepmerge-4.2.2.tgz
	https://registry.yarnpkg.com/default-gateway/-/default-gateway-6.0.3.tgz
	https://registry.yarnpkg.com/define-lazy-prop/-/define-lazy-prop-2.0.0.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.1.3.tgz
	https://registry.yarnpkg.com/defined/-/defined-1.0.0.tgz
	https://registry.yarnpkg.com/del/-/del-6.0.0.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz
	https://registry.yarnpkg.com/depd/-/depd-1.1.2.tgz
	https://registry.yarnpkg.com/destroy/-/destroy-1.0.4.tgz
	https://registry.yarnpkg.com/detect-newline/-/detect-newline-3.1.0.tgz
	https://registry.yarnpkg.com/detect-node/-/detect-node-2.1.0.tgz
	https://registry.yarnpkg.com/detect-port-alt/-/detect-port-alt-1.1.6.tgz
	https://registry.yarnpkg.com/detective/-/detective-5.2.0.tgz
	https://registry.yarnpkg.com/didyoumean/-/didyoumean-1.2.2.tgz
	https://registry.yarnpkg.com/diff-match-patch/-/diff-match-patch-1.0.5.tgz
	https://registry.yarnpkg.com/diff-sequences/-/diff-sequences-27.5.1.tgz
	https://registry.yarnpkg.com/dir-glob/-/dir-glob-3.0.1.tgz
	https://registry.yarnpkg.com/dlv/-/dlv-1.1.3.tgz
	https://registry.yarnpkg.com/dns-equal/-/dns-equal-1.0.0.tgz
	https://registry.yarnpkg.com/dns-packet/-/dns-packet-1.3.4.tgz
	https://registry.yarnpkg.com/dns-txt/-/dns-txt-2.0.2.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-2.1.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-3.0.0.tgz
	https://registry.yarnpkg.com/dom-converter/-/dom-converter-0.2.0.tgz
	https://registry.yarnpkg.com/dom-helpers/-/dom-helpers-5.2.1.tgz
	https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-0.2.2.tgz
	https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-1.3.2.tgz
	https://registry.yarnpkg.com/domelementtype/-/domelementtype-1.3.1.tgz
	https://registry.yarnpkg.com/domelementtype/-/domelementtype-2.2.0.tgz
	https://registry.yarnpkg.com/domexception/-/domexception-2.0.1.tgz
	https://registry.yarnpkg.com/domhandler/-/domhandler-4.3.1.tgz
	https://registry.yarnpkg.com/domutils/-/domutils-1.7.0.tgz
	https://registry.yarnpkg.com/domutils/-/domutils-2.8.0.tgz
	https://registry.yarnpkg.com/dot-case/-/dot-case-3.0.4.tgz
	https://registry.yarnpkg.com/dotenv-expand/-/dotenv-expand-5.1.0.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-10.0.0.tgz
	https://registry.yarnpkg.com/duplexer/-/duplexer-0.1.2.tgz
	https://registry.yarnpkg.com/ee-first/-/ee-first-1.1.1.tgz
	https://registry.yarnpkg.com/ejs/-/ejs-3.1.6.tgz
	https://registry.yarnpkg.com/electron-to-chromium/-/electron-to-chromium-1.4.93.tgz
	https://registry.yarnpkg.com/emittery/-/emittery-0.8.1.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-9.2.2.tgz
	https://registry.yarnpkg.com/emojis-list/-/emojis-list-3.0.0.tgz
	https://registry.yarnpkg.com/encodeurl/-/encodeurl-1.0.2.tgz
	https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-5.9.2.tgz
	https://registry.yarnpkg.com/entities/-/entities-2.2.0.tgz
	https://registry.yarnpkg.com/error-ex/-/error-ex-1.3.2.tgz
	https://registry.yarnpkg.com/error-stack-parser/-/error-stack-parser-2.0.7.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.19.1.tgz
	https://registry.yarnpkg.com/es-module-lexer/-/es-module-lexer-0.9.3.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz
	https://registry.yarnpkg.com/escalade/-/escalade-3.1.1.tgz
	https://registry.yarnpkg.com/escape-html/-/escape-html-1.0.3.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-2.0.0.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
	https://registry.yarnpkg.com/escodegen/-/escodegen-2.0.0.tgz
	https://registry.yarnpkg.com/eslint-config-react-app/-/eslint-config-react-app-7.0.0.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.6.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.7.3.tgz
	https://registry.yarnpkg.com/eslint-plugin-flowtype/-/eslint-plugin-flowtype-8.0.3.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.25.4.tgz
	https://registry.yarnpkg.com/eslint-plugin-jest/-/eslint-plugin-jest-25.7.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-jsx-a11y/-/eslint-plugin-jsx-a11y-6.5.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-react-hooks/-/eslint-plugin-react-hooks-4.3.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-react/-/eslint-plugin-react-7.29.4.tgz
	https://registry.yarnpkg.com/eslint-plugin-testing-library/-/eslint-plugin-testing-library-5.1.0.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.1.1.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-7.1.1.tgz
	https://registry.yarnpkg.com/eslint-utils/-/eslint-utils-3.0.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-3.3.0.tgz
	https://registry.yarnpkg.com/eslint-webpack-plugin/-/eslint-webpack-plugin-3.1.1.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-8.11.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-9.3.1.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-4.0.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.4.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.3.0.tgz
	https://registry.yarnpkg.com/estree-walker/-/estree-walker-1.0.1.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz
	https://registry.yarnpkg.com/etag/-/etag-1.8.1.tgz
	https://registry.yarnpkg.com/eventemitter3/-/eventemitter3-4.0.7.tgz
	https://registry.yarnpkg.com/events/-/events-3.3.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-5.1.1.tgz
	https://registry.yarnpkg.com/exit/-/exit-0.1.2.tgz
	https://registry.yarnpkg.com/expect/-/expect-27.5.1.tgz
	https://registry.yarnpkg.com/express/-/express-4.17.3.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.2.11.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/fastq/-/fastq-1.13.0.tgz
	https://registry.yarnpkg.com/faye-websocket/-/faye-websocket-0.11.4.tgz
	https://registry.yarnpkg.com/fb-watchman/-/fb-watchman-2.0.1.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-6.0.1.tgz
	https://registry.yarnpkg.com/file-loader/-/file-loader-6.2.0.tgz
	https://registry.yarnpkg.com/filelist/-/filelist-1.0.2.tgz
	https://registry.yarnpkg.com/filesize/-/filesize-8.0.7.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.0.1.tgz
	https://registry.yarnpkg.com/finalhandler/-/finalhandler-1.1.2.tgz
	https://registry.yarnpkg.com/find-cache-dir/-/find-cache-dir-3.3.2.tgz
	https://registry.yarnpkg.com/find-root/-/find-root-1.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-2.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-3.0.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-5.0.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-3.0.4.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-3.2.5.tgz
	https://registry.yarnpkg.com/follow-redirects/-/follow-redirects-1.14.9.tgz
	https://registry.yarnpkg.com/fork-ts-checker-webpack-plugin/-/fork-ts-checker-webpack-plugin-6.5.0.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-3.0.1.tgz
	https://registry.yarnpkg.com/forwarded/-/forwarded-0.2.0.tgz
	https://registry.yarnpkg.com/fraction.js/-/fraction.js-4.2.0.tgz
	https://registry.yarnpkg.com/fresh/-/fresh-0.5.2.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-10.0.1.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-9.1.0.tgz
	https://registry.yarnpkg.com/fs-monkey/-/fs-monkey-1.0.3.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.2.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.1.tgz
	https://registry.yarnpkg.com/functional-red-black-tree/-/functional-red-black-tree-1.0.1.tgz
	https://registry.yarnpkg.com/gensync/-/gensync-1.0.0-beta.2.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.1.1.tgz
	https://registry.yarnpkg.com/get-own-enumerable-property-symbols/-/get-own-enumerable-property-symbols-3.0.2.tgz
	https://registry.yarnpkg.com/get-package-type/-/get-package-type-0.1.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-6.0.1.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.0.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.2.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-6.0.2.tgz
	https://registry.yarnpkg.com/glob-to-regexp/-/glob-to-regexp-0.4.1.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.2.0.tgz
	https://registry.yarnpkg.com/global-modules/-/global-modules-2.0.0.tgz
	https://registry.yarnpkg.com/global-prefix/-/global-prefix-3.0.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-11.12.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-13.13.0.tgz
	https://registry.yarnpkg.com/globby/-/globby-11.1.0.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.9.tgz
	https://registry.yarnpkg.com/gzip-size/-/gzip-size-6.0.0.tgz
	https://registry.yarnpkg.com/handle-thing/-/handle-thing-2.0.1.tgz
	https://registry.yarnpkg.com/harmony-reflect/-/harmony-reflect-1.6.2.tgz
	https://registry.yarnpkg.com/has-bigints/-/has-bigints-1.0.1.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.3.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.0.tgz
	https://registry.yarnpkg.com/has/-/has-1.0.3.tgz
	https://registry.yarnpkg.com/he/-/he-1.2.0.tgz
	https://registry.yarnpkg.com/history/-/history-4.10.1.tgz
	https://registry.yarnpkg.com/hoist-non-react-statics/-/hoist-non-react-statics-3.3.2.tgz
	https://registry.yarnpkg.com/hoopy/-/hoopy-0.1.4.tgz
	https://registry.yarnpkg.com/hpack.js/-/hpack.js-2.1.6.tgz
	https://registry.yarnpkg.com/html-encoding-sniffer/-/html-encoding-sniffer-2.0.1.tgz
	https://registry.yarnpkg.com/html-entities/-/html-entities-2.3.2.tgz
	https://registry.yarnpkg.com/html-escaper/-/html-escaper-2.0.2.tgz
	https://registry.yarnpkg.com/html-minifier-terser/-/html-minifier-terser-6.1.0.tgz
	https://registry.yarnpkg.com/html-webpack-plugin/-/html-webpack-plugin-5.5.0.tgz
	https://registry.yarnpkg.com/htmlparser2/-/htmlparser2-6.1.0.tgz
	https://registry.yarnpkg.com/http-deceiver/-/http-deceiver-1.2.7.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-1.8.1.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-1.6.3.tgz
	https://registry.yarnpkg.com/http-parser-js/-/http-parser-js-0.5.6.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-4.0.1.tgz
	https://registry.yarnpkg.com/http-proxy-middleware/-/http-proxy-middleware-2.0.4.tgz
	https://registry.yarnpkg.com/http-proxy/-/http-proxy-1.18.1.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-5.0.0.tgz
	https://registry.yarnpkg.com/human-signals/-/human-signals-2.1.0.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.24.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.6.3.tgz
	https://registry.yarnpkg.com/icss-utils/-/icss-utils-5.1.0.tgz
	https://registry.yarnpkg.com/idb/-/idb-6.1.5.tgz
	https://registry.yarnpkg.com/identity-obj-proxy/-/identity-obj-proxy-3.0.0.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.2.0.tgz
	https://registry.yarnpkg.com/immer/-/immer-9.0.12.tgz
	https://registry.yarnpkg.com/immutable/-/immutable-4.0.0.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.3.0.tgz
	https://registry.yarnpkg.com/import-local/-/import-local-3.1.0.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-4.0.0.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.3.tgz
	https://registry.yarnpkg.com/ini/-/ini-1.3.8.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.0.3.tgz
	https://registry.yarnpkg.com/ip/-/ip-1.1.5.tgz
	https://registry.yarnpkg.com/ipaddr.js/-/ipaddr.js-1.9.1.tgz
	https://registry.yarnpkg.com/ipaddr.js/-/ipaddr.js-2.0.1.tgz
	https://registry.yarnpkg.com/is-arguments/-/is-arguments-1.1.1.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.2.1.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.3.2.tgz
	https://registry.yarnpkg.com/is-bigint/-/is-bigint-1.0.4.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-2.1.0.tgz
	https://registry.yarnpkg.com/is-boolean-object/-/is-boolean-object-1.1.2.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.4.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.8.1.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.5.tgz
	https://registry.yarnpkg.com/is-docker/-/is-docker-2.2.1.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-generator-fn/-/is-generator-fn-2.1.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.3.tgz
	https://registry.yarnpkg.com/is-module/-/is-module-1.0.0.tgz
	https://registry.yarnpkg.com/is-negative-zero/-/is-negative-zero-2.0.2.tgz
	https://registry.yarnpkg.com/is-number-object/-/is-number-object-1.0.6.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz
	https://registry.yarnpkg.com/is-obj/-/is-obj-1.0.1.tgz
	https://registry.yarnpkg.com/is-path-cwd/-/is-path-cwd-2.2.0.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-3.0.3.tgz
	https://registry.yarnpkg.com/is-plain-obj/-/is-plain-obj-3.0.0.tgz
	https://registry.yarnpkg.com/is-potential-custom-element-name/-/is-potential-custom-element-name-1.0.1.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.1.4.tgz
	https://registry.yarnpkg.com/is-regexp/-/is-regexp-1.0.0.tgz
	https://registry.yarnpkg.com/is-root/-/is-root-2.1.0.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.1.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-2.0.1.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.0.7.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.4.tgz
	https://registry.yarnpkg.com/is-typedarray/-/is-typedarray-1.0.0.tgz
	https://registry.yarnpkg.com/is-weakref/-/is-weakref-1.0.2.tgz
	https://registry.yarnpkg.com/is-wsl/-/is-wsl-2.2.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-0.0.1.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-coverage/-/istanbul-lib-coverage-3.2.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-instrument/-/istanbul-lib-instrument-5.1.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-report/-/istanbul-lib-report-3.0.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-source-maps/-/istanbul-lib-source-maps-4.0.1.tgz
	https://registry.yarnpkg.com/istanbul-reports/-/istanbul-reports-3.1.4.tgz
	https://registry.yarnpkg.com/jake/-/jake-10.8.4.tgz
	https://registry.yarnpkg.com/jest-changed-files/-/jest-changed-files-27.5.1.tgz
	https://registry.yarnpkg.com/jest-circus/-/jest-circus-27.5.1.tgz
	https://registry.yarnpkg.com/jest-cli/-/jest-cli-27.5.1.tgz
	https://registry.yarnpkg.com/jest-config/-/jest-config-27.5.1.tgz
	https://registry.yarnpkg.com/jest-diff/-/jest-diff-27.5.1.tgz
	https://registry.yarnpkg.com/jest-docblock/-/jest-docblock-27.5.1.tgz
	https://registry.yarnpkg.com/jest-each/-/jest-each-27.5.1.tgz
	https://registry.yarnpkg.com/jest-environment-jsdom/-/jest-environment-jsdom-27.5.1.tgz
	https://registry.yarnpkg.com/jest-environment-node/-/jest-environment-node-27.5.1.tgz
	https://registry.yarnpkg.com/jest-get-type/-/jest-get-type-27.5.1.tgz
	https://registry.yarnpkg.com/jest-haste-map/-/jest-haste-map-27.5.1.tgz
	https://registry.yarnpkg.com/jest-jasmine2/-/jest-jasmine2-27.5.1.tgz
	https://registry.yarnpkg.com/jest-leak-detector/-/jest-leak-detector-27.5.1.tgz
	https://registry.yarnpkg.com/jest-matcher-utils/-/jest-matcher-utils-27.5.1.tgz
	https://registry.yarnpkg.com/jest-message-util/-/jest-message-util-27.5.1.tgz
	https://registry.yarnpkg.com/jest-mock/-/jest-mock-27.5.1.tgz
	https://registry.yarnpkg.com/jest-pnp-resolver/-/jest-pnp-resolver-1.2.2.tgz
	https://registry.yarnpkg.com/jest-regex-util/-/jest-regex-util-27.5.1.tgz
	https://registry.yarnpkg.com/jest-resolve-dependencies/-/jest-resolve-dependencies-27.5.1.tgz
	https://registry.yarnpkg.com/jest-resolve/-/jest-resolve-27.5.1.tgz
	https://registry.yarnpkg.com/jest-runner/-/jest-runner-27.5.1.tgz
	https://registry.yarnpkg.com/jest-runtime/-/jest-runtime-27.5.1.tgz
	https://registry.yarnpkg.com/jest-serializer/-/jest-serializer-27.5.1.tgz
	https://registry.yarnpkg.com/jest-snapshot/-/jest-snapshot-27.5.1.tgz
	https://registry.yarnpkg.com/jest-util/-/jest-util-27.5.1.tgz
	https://registry.yarnpkg.com/jest-validate/-/jest-validate-27.5.1.tgz
	https://registry.yarnpkg.com/jest-watch-typeahead/-/jest-watch-typeahead-1.0.0.tgz
	https://registry.yarnpkg.com/jest-watcher/-/jest-watcher-27.5.1.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-26.6.2.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-27.5.1.tgz
	https://registry.yarnpkg.com/jest/-/jest-27.5.1.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.14.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-4.1.0.tgz
	https://registry.yarnpkg.com/jsdom/-/jsdom-16.7.0.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-2.5.2.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-0.5.0.tgz
	https://registry.yarnpkg.com/json-parse-better-errors/-/json-parse-better-errors-1.0.2.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz
	https://registry.yarnpkg.com/json-schema/-/json-schema-0.4.0.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/json5/-/json5-1.0.1.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.2.1.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-6.1.0.tgz
	https://registry.yarnpkg.com/jsonpointer/-/jsonpointer-5.0.0.tgz
	https://registry.yarnpkg.com/jsx-ast-utils/-/jsx-ast-utils-3.2.1.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-6.0.3.tgz
	https://registry.yarnpkg.com/kleur/-/kleur-3.0.3.tgz
	https://registry.yarnpkg.com/klona/-/klona-2.0.5.tgz
	https://registry.yarnpkg.com/language-subtag-registry/-/language-subtag-registry-0.3.21.tgz
	https://registry.yarnpkg.com/language-tags/-/language-tags-1.0.5.tgz
	https://registry.yarnpkg.com/leven/-/leven-3.1.0.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.4.1.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.3.0.tgz
	https://registry.yarnpkg.com/lilconfig/-/lilconfig-2.0.5.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-1.2.4.tgz
	https://registry.yarnpkg.com/loader-runner/-/loader-runner-4.2.0.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-2.0.2.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-3.2.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-2.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-3.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-6.0.0.tgz
	https://registry.yarnpkg.com/lodash.curry/-/lodash.curry-4.1.1.tgz
	https://registry.yarnpkg.com/lodash.debounce/-/lodash.debounce-4.0.8.tgz
	https://registry.yarnpkg.com/lodash.get/-/lodash.get-4.4.2.tgz
	https://registry.yarnpkg.com/lodash.isequal/-/lodash.isequal-4.5.0.tgz
	https://registry.yarnpkg.com/lodash.memoize/-/lodash.memoize-4.1.2.tgz
	https://registry.yarnpkg.com/lodash.merge/-/lodash.merge-4.6.2.tgz
	https://registry.yarnpkg.com/lodash.sortby/-/lodash.sortby-4.7.0.tgz
	https://registry.yarnpkg.com/lodash.uniq/-/lodash.uniq-4.5.0.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.21.tgz
	https://registry.yarnpkg.com/loose-envify/-/loose-envify-1.4.0.tgz
	https://registry.yarnpkg.com/lower-case/-/lower-case-2.0.2.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-6.0.0.tgz
	https://registry.yarnpkg.com/magic-string/-/magic-string-0.25.9.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-3.1.0.tgz
	https://registry.yarnpkg.com/makeerror/-/makeerror-1.0.12.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.0.14.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.0.4.tgz
	https://registry.yarnpkg.com/media-typer/-/media-typer-0.3.0.tgz
	https://registry.yarnpkg.com/memfs/-/memfs-3.4.1.tgz
	https://registry.yarnpkg.com/memoize-one/-/memoize-one-5.2.1.tgz
	https://registry.yarnpkg.com/merge-descriptors/-/merge-descriptors-1.0.1.tgz
	https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.4.1.tgz
	https://registry.yarnpkg.com/methods/-/methods-1.1.2.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.5.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.52.0.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.35.tgz
	https://registry.yarnpkg.com/mime/-/mime-1.6.0.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-2.1.0.tgz
	https://registry.yarnpkg.com/mini-create-react-context/-/mini-create-react-context-0.4.1.tgz
	https://registry.yarnpkg.com/mini-css-extract-plugin/-/mini-css-extract-plugin-2.6.0.tgz
	https://registry.yarnpkg.com/minimalistic-assert/-/minimalistic-assert-1.0.1.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.0.4.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.1.2.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.6.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.6.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.0.0.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.2.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.3.tgz
	https://registry.yarnpkg.com/multicast-dns-service-types/-/multicast-dns-service-types-1.1.0.tgz
	https://registry.yarnpkg.com/multicast-dns/-/multicast-dns-6.2.3.tgz
	https://registry.yarnpkg.com/nanoid/-/nanoid-3.3.1.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-0.6.3.tgz
	https://registry.yarnpkg.com/neo-async/-/neo-async-2.6.2.tgz
	https://registry.yarnpkg.com/no-case/-/no-case-3.0.4.tgz
	https://registry.yarnpkg.com/node-forge/-/node-forge-1.3.0.tgz
	https://registry.yarnpkg.com/node-int64/-/node-int64-0.4.0.tgz
	https://registry.yarnpkg.com/node-releases/-/node-releases-2.0.2.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-3.0.0.tgz
	https://registry.yarnpkg.com/normalize-range/-/normalize-range-0.1.2.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-6.1.0.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-4.0.1.tgz
	https://registry.yarnpkg.com/nth-check/-/nth-check-1.0.2.tgz
	https://registry.yarnpkg.com/nth-check/-/nth-check-2.0.1.tgz
	https://registry.yarnpkg.com/nwsapi/-/nwsapi-2.2.0.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz
	https://registry.yarnpkg.com/object-hash/-/object-hash-2.2.0.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.12.0.tgz
	https://registry.yarnpkg.com/object-is/-/object-is-1.1.5.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.2.tgz
	https://registry.yarnpkg.com/object.entries/-/object.entries-1.1.5.tgz
	https://registry.yarnpkg.com/object.fromentries/-/object.fromentries-2.0.5.tgz
	https://registry.yarnpkg.com/object.getownpropertydescriptors/-/object.getownpropertydescriptors-2.1.3.tgz
	https://registry.yarnpkg.com/object.hasown/-/object.hasown-1.1.0.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.1.5.tgz
	https://registry.yarnpkg.com/obuf/-/obuf-1.1.2.tgz
	https://registry.yarnpkg.com/on-finished/-/on-finished-2.3.0.tgz
	https://registry.yarnpkg.com/on-headers/-/on-headers-1.0.2.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-5.1.2.tgz
	https://registry.yarnpkg.com/open/-/open-8.4.0.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.8.3.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.9.1.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-1.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-3.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-2.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-3.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-5.0.0.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-4.0.0.tgz
	https://registry.yarnpkg.com/p-retry/-/p-retry-4.6.1.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-1.0.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz
	https://registry.yarnpkg.com/param-case/-/param-case-3.0.4.tgz
	https://registry.yarnpkg.com/parent-module/-/parent-module-1.0.1.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-5.2.0.tgz
	https://registry.yarnpkg.com/parse5/-/parse5-6.0.1.tgz
	https://registry.yarnpkg.com/parseurl/-/parseurl-1.3.3.tgz
	https://registry.yarnpkg.com/pascal-case/-/pascal-case-3.1.2.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-3.0.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.7.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-0.1.7.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-1.8.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-4.0.0.tgz
	https://registry.yarnpkg.com/performance-now/-/performance-now-2.1.0.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-0.2.1.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-1.0.0.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.3.1.tgz
	https://registry.yarnpkg.com/pirates/-/pirates-4.0.5.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-4.2.0.tgz
	https://registry.yarnpkg.com/pkg-up/-/pkg-up-3.1.0.tgz
	https://registry.yarnpkg.com/portfinder/-/portfinder-1.0.28.tgz
	https://registry.yarnpkg.com/postcss-attribute-case-insensitive/-/postcss-attribute-case-insensitive-5.0.0.tgz
	https://registry.yarnpkg.com/postcss-browser-comments/-/postcss-browser-comments-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-calc/-/postcss-calc-8.2.4.tgz
	https://registry.yarnpkg.com/postcss-clamp/-/postcss-clamp-4.1.0.tgz
	https://registry.yarnpkg.com/postcss-color-functional-notation/-/postcss-color-functional-notation-4.2.2.tgz
	https://registry.yarnpkg.com/postcss-color-hex-alpha/-/postcss-color-hex-alpha-8.0.3.tgz
	https://registry.yarnpkg.com/postcss-color-rebeccapurple/-/postcss-color-rebeccapurple-7.0.2.tgz
	https://registry.yarnpkg.com/postcss-colormin/-/postcss-colormin-5.3.0.tgz
	https://registry.yarnpkg.com/postcss-convert-values/-/postcss-convert-values-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-custom-media/-/postcss-custom-media-8.0.0.tgz
	https://registry.yarnpkg.com/postcss-custom-properties/-/postcss-custom-properties-12.1.5.tgz
	https://registry.yarnpkg.com/postcss-custom-selectors/-/postcss-custom-selectors-6.0.0.tgz
	https://registry.yarnpkg.com/postcss-dir-pseudo-class/-/postcss-dir-pseudo-class-6.0.4.tgz
	https://registry.yarnpkg.com/postcss-discard-comments/-/postcss-discard-comments-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-discard-duplicates/-/postcss-discard-duplicates-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-discard-empty/-/postcss-discard-empty-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-discard-overridden/-/postcss-discard-overridden-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-double-position-gradients/-/postcss-double-position-gradients-3.1.1.tgz
	https://registry.yarnpkg.com/postcss-env-function/-/postcss-env-function-4.0.6.tgz
	https://registry.yarnpkg.com/postcss-flexbugs-fixes/-/postcss-flexbugs-fixes-5.0.2.tgz
	https://registry.yarnpkg.com/postcss-focus-visible/-/postcss-focus-visible-6.0.4.tgz
	https://registry.yarnpkg.com/postcss-focus-within/-/postcss-focus-within-5.0.4.tgz
	https://registry.yarnpkg.com/postcss-font-variant/-/postcss-font-variant-5.0.0.tgz
	https://registry.yarnpkg.com/postcss-gap-properties/-/postcss-gap-properties-3.0.3.tgz
	https://registry.yarnpkg.com/postcss-image-set-function/-/postcss-image-set-function-4.0.6.tgz
	https://registry.yarnpkg.com/postcss-initial/-/postcss-initial-4.0.1.tgz
	https://registry.yarnpkg.com/postcss-js/-/postcss-js-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-lab-function/-/postcss-lab-function-4.1.2.tgz
	https://registry.yarnpkg.com/postcss-load-config/-/postcss-load-config-3.1.3.tgz
	https://registry.yarnpkg.com/postcss-loader/-/postcss-loader-6.2.1.tgz
	https://registry.yarnpkg.com/postcss-logical/-/postcss-logical-5.0.4.tgz
	https://registry.yarnpkg.com/postcss-media-minmax/-/postcss-media-minmax-5.0.0.tgz
	https://registry.yarnpkg.com/postcss-merge-longhand/-/postcss-merge-longhand-5.1.3.tgz
	https://registry.yarnpkg.com/postcss-merge-rules/-/postcss-merge-rules-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-minify-font-values/-/postcss-minify-font-values-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-minify-gradients/-/postcss-minify-gradients-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-minify-params/-/postcss-minify-params-5.1.2.tgz
	https://registry.yarnpkg.com/postcss-minify-selectors/-/postcss-minify-selectors-5.2.0.tgz
	https://registry.yarnpkg.com/postcss-modules-extract-imports/-/postcss-modules-extract-imports-3.0.0.tgz
	https://registry.yarnpkg.com/postcss-modules-local-by-default/-/postcss-modules-local-by-default-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-modules-scope/-/postcss-modules-scope-3.0.0.tgz
	https://registry.yarnpkg.com/postcss-modules-values/-/postcss-modules-values-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-nested/-/postcss-nested-5.0.6.tgz
	https://registry.yarnpkg.com/postcss-nesting/-/postcss-nesting-10.1.3.tgz
	https://registry.yarnpkg.com/postcss-normalize-charset/-/postcss-normalize-charset-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-display-values/-/postcss-normalize-display-values-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-positions/-/postcss-normalize-positions-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-repeat-style/-/postcss-normalize-repeat-style-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-string/-/postcss-normalize-string-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-timing-functions/-/postcss-normalize-timing-functions-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-unicode/-/postcss-normalize-unicode-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-url/-/postcss-normalize-url-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-whitespace/-/postcss-normalize-whitespace-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-normalize/-/postcss-normalize-10.0.1.tgz
	https://registry.yarnpkg.com/postcss-opacity-percentage/-/postcss-opacity-percentage-1.1.2.tgz
	https://registry.yarnpkg.com/postcss-ordered-values/-/postcss-ordered-values-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-overflow-shorthand/-/postcss-overflow-shorthand-3.0.3.tgz
	https://registry.yarnpkg.com/postcss-page-break/-/postcss-page-break-3.0.4.tgz
	https://registry.yarnpkg.com/postcss-place/-/postcss-place-7.0.4.tgz
	https://registry.yarnpkg.com/postcss-preset-env/-/postcss-preset-env-7.4.3.tgz
	https://registry.yarnpkg.com/postcss-pseudo-class-any-link/-/postcss-pseudo-class-any-link-7.1.1.tgz
	https://registry.yarnpkg.com/postcss-reduce-initial/-/postcss-reduce-initial-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-reduce-transforms/-/postcss-reduce-transforms-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-replace-overflow-wrap/-/postcss-replace-overflow-wrap-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-selector-not/-/postcss-selector-not-5.0.0.tgz
	https://registry.yarnpkg.com/postcss-selector-parser/-/postcss-selector-parser-6.0.9.tgz
	https://registry.yarnpkg.com/postcss-svgo/-/postcss-svgo-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-unique-selectors/-/postcss-unique-selectors-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-value-parser/-/postcss-value-parser-4.2.0.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-7.0.39.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-8.4.12.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.2.1.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.1.2.tgz
	https://registry.yarnpkg.com/pretty-bytes/-/pretty-bytes-5.6.0.tgz
	https://registry.yarnpkg.com/pretty-error/-/pretty-error-4.0.0.tgz
	https://registry.yarnpkg.com/pretty-format/-/pretty-format-27.5.1.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.1.tgz
	https://registry.yarnpkg.com/promise/-/promise-8.1.0.tgz
	https://registry.yarnpkg.com/prompts/-/prompts-2.4.2.tgz
	https://registry.yarnpkg.com/prop-types/-/prop-types-15.8.1.tgz
	https://registry.yarnpkg.com/proxy-addr/-/proxy-addr-2.0.7.tgz
	https://registry.yarnpkg.com/psl/-/psl-1.8.0.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.1.1.tgz
	https://registry.yarnpkg.com/q/-/q-1.5.1.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.9.7.tgz
	https://registry.yarnpkg.com/queue-microtask/-/queue-microtask-1.2.3.tgz
	https://registry.yarnpkg.com/quick-lru/-/quick-lru-5.1.1.tgz
	https://registry.yarnpkg.com/raf/-/raf-3.4.1.tgz
	https://registry.yarnpkg.com/randombytes/-/randombytes-2.1.0.tgz
	https://registry.yarnpkg.com/range-parser/-/range-parser-1.2.1.tgz
	https://registry.yarnpkg.com/raw-body/-/raw-body-2.4.3.tgz
	https://registry.yarnpkg.com/react-ace/-/react-ace-9.5.0.tgz
	https://registry.yarnpkg.com/react-app-polyfill/-/react-app-polyfill-3.0.0.tgz
	https://registry.yarnpkg.com/react-base16-styling/-/react-base16-styling-0.9.1.tgz
	https://registry.yarnpkg.com/react-contextmenu/-/react-contextmenu-2.14.0.tgz
	https://registry.yarnpkg.com/react-dev-utils/-/react-dev-utils-12.0.0.tgz
	https://registry.yarnpkg.com/react-dom/-/react-dom-17.0.2.tgz
	https://registry.yarnpkg.com/react-error-overlay/-/react-error-overlay-6.0.10.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-16.13.1.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-17.0.2.tgz
	https://registry.yarnpkg.com/react-json-tree/-/react-json-tree-0.16.1.tgz
	https://registry.yarnpkg.com/react-refresh/-/react-refresh-0.11.0.tgz
	https://registry.yarnpkg.com/react-router-dom/-/react-router-dom-5.3.0.tgz
	https://registry.yarnpkg.com/react-router/-/react-router-5.2.1.tgz
	https://registry.yarnpkg.com/react-scripts/-/react-scripts-5.0.0.tgz
	https://registry.yarnpkg.com/react-select/-/react-select-5.2.2.tgz
	https://registry.yarnpkg.com/react-transition-group/-/react-transition-group-4.4.2.tgz
	https://registry.yarnpkg.com/react/-/react-17.0.2.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.7.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.6.0.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.6.0.tgz
	https://registry.yarnpkg.com/recursive-readdir/-/recursive-readdir-2.2.2.tgz
	https://registry.yarnpkg.com/regenerate-unicode-properties/-/regenerate-unicode-properties-10.0.1.tgz
	https://registry.yarnpkg.com/regenerate/-/regenerate-1.4.2.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.13.9.tgz
	https://registry.yarnpkg.com/regenerator-transform/-/regenerator-transform-0.14.5.tgz
	https://registry.yarnpkg.com/regex-parser/-/regex-parser-2.2.11.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.4.1.tgz
	https://registry.yarnpkg.com/regexpp/-/regexpp-3.2.0.tgz
	https://registry.yarnpkg.com/regexpu-core/-/regexpu-core-5.0.1.tgz
	https://registry.yarnpkg.com/regjsgen/-/regjsgen-0.6.0.tgz
	https://registry.yarnpkg.com/regjsparser/-/regjsparser-0.8.4.tgz
	https://registry.yarnpkg.com/relateurl/-/relateurl-0.2.7.tgz
	https://registry.yarnpkg.com/renderkid/-/renderkid-3.0.0.tgz
	https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz
	https://registry.yarnpkg.com/require-from-string/-/require-from-string-2.0.2.tgz
	https://registry.yarnpkg.com/requires-port/-/requires-port-1.0.0.tgz
	https://registry.yarnpkg.com/resolve-cwd/-/resolve-cwd-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-4.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-5.0.0.tgz
	https://registry.yarnpkg.com/resolve-pathname/-/resolve-pathname-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-url-loader/-/resolve-url-loader-4.0.0.tgz
	https://registry.yarnpkg.com/resolve.exports/-/resolve.exports-1.1.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-2.0.0-next.3.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.13.1.tgz
	https://registry.yarnpkg.com/reusify/-/reusify-1.0.4.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/rollup-plugin-terser/-/rollup-plugin-terser-7.0.2.tgz
	https://registry.yarnpkg.com/rollup/-/rollup-2.70.1.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.2.0.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.1.tgz
	https://registry.yarnpkg.com/safer-buffer/-/safer-buffer-2.1.2.tgz
	https://registry.yarnpkg.com/sanitize.css/-/sanitize.css-13.0.0.tgz
	https://registry.yarnpkg.com/sass-loader/-/sass-loader-12.6.0.tgz
	https://registry.yarnpkg.com/sass/-/sass-1.49.9.tgz
	https://registry.yarnpkg.com/sax/-/sax-1.2.4.tgz
	https://registry.yarnpkg.com/saxes/-/saxes-5.0.1.tgz
	https://registry.yarnpkg.com/scheduler/-/scheduler-0.20.2.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-2.7.0.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-2.7.1.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-3.1.1.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-4.0.0.tgz
	https://registry.yarnpkg.com/select-hose/-/select-hose-2.0.0.tgz
	https://registry.yarnpkg.com/selfsigned/-/selfsigned-2.0.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.0.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.3.5.tgz
	https://registry.yarnpkg.com/send/-/send-0.17.2.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-4.0.0.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-6.0.0.tgz
	https://registry.yarnpkg.com/serve-index/-/serve-index-1.9.1.tgz
	https://registry.yarnpkg.com/serve-static/-/serve-static-1.14.2.tgz
	https://registry.yarnpkg.com/setprototypeof/-/setprototypeof-1.1.0.tgz
	https://registry.yarnpkg.com/setprototypeof/-/setprototypeof-1.2.0.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/shell-quote/-/shell-quote-1.7.3.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.0.4.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.7.tgz
	https://registry.yarnpkg.com/simple-swizzle/-/simple-swizzle-0.2.2.tgz
	https://registry.yarnpkg.com/sisteransi/-/sisteransi-1.0.5.tgz
	https://registry.yarnpkg.com/slash/-/slash-3.0.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-4.0.0.tgz
	https://registry.yarnpkg.com/sockjs/-/sockjs-0.3.24.tgz
	https://registry.yarnpkg.com/source-list-map/-/source-list-map-2.0.1.tgz
	https://registry.yarnpkg.com/source-map-js/-/source-map-js-1.0.2.tgz
	https://registry.yarnpkg.com/source-map-loader/-/source-map-loader-3.0.1.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.21.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.5.7.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.7.3.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.8.0-beta.0.tgz
	https://registry.yarnpkg.com/sourcemap-codec/-/sourcemap-codec-1.4.8.tgz
	https://registry.yarnpkg.com/spdy-transport/-/spdy-transport-3.0.0.tgz
	https://registry.yarnpkg.com/spdy/-/spdy-4.0.2.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.0.3.tgz
	https://registry.yarnpkg.com/stable/-/stable-0.1.8.tgz
	https://registry.yarnpkg.com/stack-utils/-/stack-utils-2.0.5.tgz
	https://registry.yarnpkg.com/stackframe/-/stackframe-1.2.1.tgz
	https://registry.yarnpkg.com/statuses/-/statuses-1.5.0.tgz
	https://registry.yarnpkg.com/string-length/-/string-length-4.0.2.tgz
	https://registry.yarnpkg.com/string-length/-/string-length-5.0.1.tgz
	https://registry.yarnpkg.com/string-natural-compare/-/string-natural-compare-3.0.1.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz
	https://registry.yarnpkg.com/string.prototype.matchall/-/string.prototype.matchall-4.0.7.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.4.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.4.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.3.0.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz
	https://registry.yarnpkg.com/stringify-object/-/stringify-object-3.3.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-7.0.1.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-3.0.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-4.0.0.tgz
	https://registry.yarnpkg.com/strip-comments/-/strip-comments-2.0.1.tgz
	https://registry.yarnpkg.com/strip-final-newline/-/strip-final-newline-2.0.0.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.1.1.tgz
	https://registry.yarnpkg.com/style-loader/-/style-loader-3.3.1.tgz
	https://registry.yarnpkg.com/stylehacks/-/stylehacks-5.1.0.tgz
	https://registry.yarnpkg.com/stylis/-/stylis-4.0.13.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.5.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.2.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-8.1.1.tgz
	https://registry.yarnpkg.com/supports-hyperlinks/-/supports-hyperlinks-2.2.0.tgz
	https://registry.yarnpkg.com/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz
	https://registry.yarnpkg.com/svg-parser/-/svg-parser-2.0.4.tgz
	https://registry.yarnpkg.com/svgo/-/svgo-1.3.2.tgz
	https://registry.yarnpkg.com/svgo/-/svgo-2.8.0.tgz
	https://registry.yarnpkg.com/symbol-tree/-/symbol-tree-3.2.4.tgz
	https://registry.yarnpkg.com/tailwindcss/-/tailwindcss-3.0.23.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-1.1.3.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-2.2.1.tgz
	https://registry.yarnpkg.com/temp-dir/-/temp-dir-2.0.0.tgz
	https://registry.yarnpkg.com/tempy/-/tempy-0.6.0.tgz
	https://registry.yarnpkg.com/terminal-link/-/terminal-link-2.1.1.tgz
	https://registry.yarnpkg.com/terser-webpack-plugin/-/terser-webpack-plugin-5.3.1.tgz
	https://registry.yarnpkg.com/terser/-/terser-5.12.1.tgz
	https://registry.yarnpkg.com/test-exclude/-/test-exclude-6.0.0.tgz
	https://registry.yarnpkg.com/text-table/-/text-table-0.2.0.tgz
	https://registry.yarnpkg.com/throat/-/throat-6.0.1.tgz
	https://registry.yarnpkg.com/thunky/-/thunky-1.1.0.tgz
	https://registry.yarnpkg.com/timsort/-/timsort-0.3.0.tgz
	https://registry.yarnpkg.com/tiny-invariant/-/tiny-invariant-1.2.0.tgz
	https://registry.yarnpkg.com/tiny-warning/-/tiny-warning-1.0.3.tgz
	https://registry.yarnpkg.com/tmpl/-/tmpl-1.0.5.tgz
	https://registry.yarnpkg.com/to-fast-properties/-/to-fast-properties-2.0.0.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/toidentifier/-/toidentifier-1.0.1.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-4.0.0.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-1.0.1.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-2.1.0.tgz
	https://registry.yarnpkg.com/tryer/-/tryer-1.0.1.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-3.14.1.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.14.1.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.3.1.tgz
	https://registry.yarnpkg.com/tsutils/-/tsutils-3.21.0.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.4.0.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.3.2.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-4.0.8.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.16.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.20.2.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.21.3.tgz
	https://registry.yarnpkg.com/type-is/-/type-is-1.6.18.tgz
	https://registry.yarnpkg.com/typedarray-to-buffer/-/typedarray-to-buffer-3.1.5.tgz
	https://registry.yarnpkg.com/unbox-primitive/-/unbox-primitive-1.0.1.tgz
	https://registry.yarnpkg.com/unicode-canonical-property-names-ecmascript/-/unicode-canonical-property-names-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unicode-match-property-ecmascript/-/unicode-match-property-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unicode-match-property-value-ecmascript/-/unicode-match-property-value-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unicode-property-aliases-ecmascript/-/unicode-property-aliases-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unique-string/-/unique-string-2.0.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.1.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-2.0.0.tgz
	https://registry.yarnpkg.com/unpipe/-/unpipe-1.0.0.tgz
	https://registry.yarnpkg.com/unquote/-/unquote-1.1.1.tgz
	https://registry.yarnpkg.com/upath/-/upath-1.2.0.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.4.1.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/util.promisify/-/util.promisify-1.0.1.tgz
	https://registry.yarnpkg.com/utila/-/utila-0.4.0.tgz
	https://registry.yarnpkg.com/utils-merge/-/utils-merge-1.0.1.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-8.3.2.tgz
	https://registry.yarnpkg.com/v8-compile-cache/-/v8-compile-cache-2.3.0.tgz
	https://registry.yarnpkg.com/v8-to-istanbul/-/v8-to-istanbul-8.1.1.tgz
	https://registry.yarnpkg.com/value-equal/-/value-equal-1.0.1.tgz
	https://registry.yarnpkg.com/vary/-/vary-1.1.2.tgz
	https://registry.yarnpkg.com/w3c-hr-time/-/w3c-hr-time-1.0.2.tgz
	https://registry.yarnpkg.com/w3c-xmlserializer/-/w3c-xmlserializer-2.0.0.tgz
	https://registry.yarnpkg.com/walker/-/walker-1.0.8.tgz
	https://registry.yarnpkg.com/watchpack/-/watchpack-2.3.1.tgz
	https://registry.yarnpkg.com/wbuf/-/wbuf-1.7.3.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-4.0.2.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-5.0.0.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-6.1.0.tgz
	https://registry.yarnpkg.com/webpack-dev-middleware/-/webpack-dev-middleware-5.3.1.tgz
	https://registry.yarnpkg.com/webpack-dev-server/-/webpack-dev-server-4.7.4.tgz
	https://registry.yarnpkg.com/webpack-manifest-plugin/-/webpack-manifest-plugin-4.1.1.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-1.4.3.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-2.3.1.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-3.2.3.tgz
	https://registry.yarnpkg.com/webpack/-/webpack-5.70.0.tgz
	https://registry.yarnpkg.com/websocket-driver/-/websocket-driver-0.7.4.tgz
	https://registry.yarnpkg.com/websocket-extensions/-/websocket-extensions-0.1.4.tgz
	https://registry.yarnpkg.com/whatwg-encoding/-/whatwg-encoding-1.0.5.tgz
	https://registry.yarnpkg.com/whatwg-fetch/-/whatwg-fetch-3.6.2.tgz
	https://registry.yarnpkg.com/whatwg-mimetype/-/whatwg-mimetype-2.3.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-7.1.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-8.7.0.tgz
	https://registry.yarnpkg.com/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/which/-/which-1.3.1.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz
	https://registry.yarnpkg.com/word-wrap/-/word-wrap-1.2.3.tgz
	https://registry.yarnpkg.com/workbox-background-sync/-/workbox-background-sync-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-broadcast-update/-/workbox-broadcast-update-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-build/-/workbox-build-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-cacheable-response/-/workbox-cacheable-response-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-core/-/workbox-core-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-expiration/-/workbox-expiration-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-google-analytics/-/workbox-google-analytics-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-navigation-preload/-/workbox-navigation-preload-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-precaching/-/workbox-precaching-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-range-requests/-/workbox-range-requests-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-recipes/-/workbox-recipes-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-routing/-/workbox-routing-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-strategies/-/workbox-strategies-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-streams/-/workbox-streams-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-sw/-/workbox-sw-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-webpack-plugin/-/workbox-webpack-plugin-6.5.2.tgz
	https://registry.yarnpkg.com/workbox-window/-/workbox-window-6.5.2.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-3.0.3.tgz
	https://registry.yarnpkg.com/ws/-/ws-7.5.7.tgz
	https://registry.yarnpkg.com/ws/-/ws-8.5.0.tgz
	https://registry.yarnpkg.com/xml-name-validator/-/xml-name-validator-3.0.0.tgz
	https://registry.yarnpkg.com/xmlchars/-/xmlchars-2.2.0.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-4.0.2.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-5.0.8.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-4.0.0.tgz
	https://registry.yarnpkg.com/yaml/-/yaml-1.10.2.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-20.2.9.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-16.2.0.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-0.1.0.tgz
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	acct-user/maubot
	>=dev-python/mautrix-0.15.5
	<dev-python/mautrix-0.18.0
	>=dev-python/aiohttp-3.0.0
	<dev-python/aiohttp-4.0.0
	>=dev-python/yarl-1.0.0
	<dev-python/yarl-2.0.0
	>=dev-python/sqlalchemy-1.0.0
	<dev-python/sqlalchemy-1.4.0
	>=dev-python/asyncpg-0.20.0
	<dev-python/asyncpg-0.26.0
	>=dev-python/aiosqlite-0.16.0
	<dev-python/aiosqlite-0.18.0
	>=dev-python/commonmark-0.9.0
	<dev-python/commonmark-1.0.0
	>=dev-python/ruamel-yaml-0.15.35
	<dev-python/ruamel-yaml-0.18.0
	>=dev-python/attrs-18.1.0
	>=dev-python/bcrypt-3.0.0
	<dev-python/bcrypt-4.0.0
	>=dev-python/packaging-10.0.0
	>=dev-python/click-7.0.0
	<dev-python/click-9.0.0
	>=dev-python/colorama-0.4.0
	<dev-python/colorama-0.5.0
	>=dev-python/questionary-1.0.0
	<dev-python/questionary-2.0.0
	>=dev-python/jinja-2.0.0
	<dev-python/jinja-4.0.0
"
RDEPEND="${DEPEND}"
BDEPEND="
	sys-apps/yarn
"

S="${WORKDIR}/maubot-${GIT_COMMIT}"

PATCHES=(
	"${FILESDIR}"/maubot_ignore_example_config_in_package_data-${PV}.patch
	"${FILESDIR}"/example-config.yaml-${PV}.patch
)

src_unpack() {
	unpack ${P}.tar.gz
}

python_compile() {
	distutils-r1_python_compile
	(
		cd maubot/management/frontend
		yarn config set disable-self-update-check true || die
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
		yarn --offline --frozen-lockfile || die
		yarn --offline --frozen-lockfile build || die
	) || die
}

src_install() {
	distutils-r1_src_install
	insinto "/etc/${PN}"
	doins maubot/example-config.yaml

	insinto "/var/lib/maubot"
	doins -r maubot/management/frontend/build
	mv "${ED}/var/lib/maubot/build" "${ED}/var/lib/maubot/frontend"

	keepdir "/var/log/maubot"
	fowners maubot:maubot /var/log/maubot
	keepdir "/var/lib/maubot/plugins/sqlite"
	keepdir "/var/lib/maubot/plugins/upload"
	keepdir "/var/lib/maubot/plugins/active"
	keepdir "/var/lib/maubot/plugins/trash"
	fowners -R maubot:maubot /var/lib/maubot

	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	newinitd "${FILESDIR}/${PN}.initd" "${PN}"

	einfo "Copy ${EPREFIX}/etc/${PN}/example-config.yaml"
	einfo "into ${EPREFIX}/etc/${PN}/config.yaml"
	einfo "and edit to your liking."
	einfo "Start manually with"
	einfo "  ${EPREFIX}/etc/init.d/maubot start"
	einfo "or add to the default runlevel with"
	einfo "  rcupdate add maubot"
	einfo "The management interface should now be available at"
	einfo "http://localhost:29316/_matrix/maubot"
	einfo "or whatever you configured."
}
