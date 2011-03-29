package Catalyst::Model::REST::Serializer;
BEGIN {
  $Catalyst::Model::REST::Serializer::VERSION = '0.15';
}
use 5.010;
use Moose;
use Moose::Util::TypeConstraints;

with 'Data::Serializable' => { -version => '0.40.1' };

has 'type' => (
    isa => enum ([qw{application/json application/xml application/yaml}]),
    is  => 'rw',
	default => 'application/json',
	trigger   => \&_set_module
);
no Moose::Util::TypeConstraints;

no Moose;

our %modules = (
	'application/json' => {
		module => 'JSON',
	},
	'application/xml' => {
		module => 'XML::Simple',
	},
	'application/yaml' => {
		module => 'YAML',
	},
);

sub _set_module {
	my ($self, $type) = @_;
	$self->serializer_module($modules{$type}{module});
}

sub content_type {
	my ($self) = @_;
	return $self->type;
}

1;

__END__
=pod

=head1 NAME

Catalyst::Model::REST::Serializer

=head1 VERSION

version 0.15

=head1 AUTHOR

Kaare Rasmussen <kaare at cpan dot net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Kaare Rasmussen.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

