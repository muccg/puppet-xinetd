# == Class: xinetd::service
#
# TODO: document me
#
class xinetd::service {

    case $::operatingsystem {
        'Ubuntu': {
            $service_provider = upstart
        }
        default: {
            $service_provider = undef
        }
    }

	service { 'xinetd':
		ensure     => running,
		hasrestart => true,
        provider   => $serice_provider
	}
}
