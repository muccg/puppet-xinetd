# == Define: xinetd::server
#
# TODO: document me
#
define xinetd::server (
	$id,
	$server,
	$port,
	$bind='',
	$type='',
	$socket_type=stream,
	$protocol=tcp,
	$flags=IPv6,
	$wait=no,
	$user=root,
	$group='',
	$server_args='',
	$nice=10,
	$instances=100,
	$per_source=3,
	$cps='0 0',
	$passenv='',
	$log_on_success='',
	$log_on_failure='',
	$ensure=present
	) {
	include xinetd

	case $ensure {
		present,absent,file: {}
		default: { fail("Invalid ensure for '${name}'") }
	}

	file { "/etc/xinetd.d/${name}":
		ensure  => $ensure,
		content => template('xinetd/service.erb'),
		notify  => Service['xinetd'],
		require => Package['xinetd'],
	}
}
