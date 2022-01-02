project('glib-footprint', 'vala',
  default_options: [
    'c_std=gnu99',
    'default_library=static',
    'optimization=s',
    'b_ndebug=true',
    'strip=true',
  ],
)

#'b_lto=true',

host_os = host_machine.system()
if host_os == 'android'
  host_os_family = 'linux'
else
  host_os_family = host_os
endif

extra_c_args = []
extra_link_args = []
extra_link_depends = []

# Get rid of unused code.
if host_os_family == 'darwin'
  extra_link_args += '-Wl,-dead_strip'
elif host_os_family != 'windows'
  extra_c_args += ['-ffunction-sections', '-fdata-sections', '-fno-asynchronous-unwind-tables']
  extra_link_args += '-Wl,--gc-sections'
endif

# Ensure no symbols are visible, so the static linker can eliminate more code.
if host_os_family == 'darwin'
  symlist = 'no-exports.symbols'
  extra_link_args += '-Wl,-exported_symbols_list,' + meson.current_source_dir() / symlist
  extra_link_depends += symlist
elif host_os_family != 'windows'
  symscript = 'no-exports.version'
  extra_link_args += '-Wl,--version-script,' + meson.current_source_dir() / symscript
  extra_link_depends += symscript
endif

add_global_arguments(extra_c_args, language: 'c')
add_project_link_arguments(extra_link_args, language: 'c')

add_project_arguments(
  '-DG_LOG_DOMAIN="Frida"',
  '-DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_68',
  '-DG_DISABLE_DEPRECATED',
  language: 'c')

ndebug = get_option('b_ndebug')
optimize_for_prod = ndebug == 'true' or (ndebug == 'if-release' and not get_option('debug'))
if optimize_for_prod
  add_project_arguments(
    '-DG_DISABLE_ASSERT',
    '-DG_DISABLE_CHECKS',
    '-DG_DISABLE_CAST_CHECKS',
    language: 'c')
endif

glib_options = [
  'diet=true',
  'printf=system',
  'selinux=disabled',
  'xattr=false',
  'libmount=disabled',
  'tests=false',
]
if optimize_for_prod
  glib_options += [
    'glib_debug=disabled',
    'glib_assert=false',
    'glib_checks=false',
  ]
endif
glib_dep = dependency('glib-2.0', version: '>=2.56', default_options: glib_options)
gobject_dep = dependency('gobject-2.0', version: '>=2.56', default_options: glib_options)

executable('01-empty', 'empty.vala',
  link_depends: extra_link_depends,
  dependencies: [glib_dep],
)

executable('02-datastructures', 'datastructures.vala',
  link_depends: extra_link_depends,
  dependencies: [glib_dep],
)

executable('03-compact-classes', 'compact-classes.vala',
  link_depends: extra_link_depends,
  dependencies: [glib_dep],
)

executable('04-full-classes', 'full-classes.vala',
  link_depends: extra_link_depends,
  dependencies: [glib_dep, gobject_dep],
)
