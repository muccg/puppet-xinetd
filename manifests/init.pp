# == Class: xinetd
#
# TODO: document me
#
class xinetd {
	include xinetd::service

	package { 'xinetd':
		ensure => installed,
	}

}
