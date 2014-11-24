class xinetd {
	package { 'xinetd': }
}

class xinetd::service {}
class {'xinetd::service': }

xinetd::server { 'test':
	id     => test,
	server => '/bin/true',
	port   => telnet,
}
