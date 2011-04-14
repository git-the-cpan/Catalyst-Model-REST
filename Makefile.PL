
use strict;
use warnings;

BEGIN { require 5.010; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'REST model class for Catalyst',
  'AUTHOR' => 'Kaare Rasmussen <kaare at cpan dot net>',
  'BUILD_REQUIRES' => {
    'JSON::XS' => '0',
    'Module::Build' => '0.3601',
    'Test::More' => '0',
    'XML::Simple' => '0',
    'YAML' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31',
    'Module::Build' => '0.3601'
  },
  'DISTNAME' => 'Catalyst-Model-REST',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Catalyst::Model::REST',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Catalyst::Model' => '0',
    'Data::Serializable' => '0.40.1',
    'HTTP::Tiny' => '0',
    'Moose' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'Try::Tiny' => '0',
    'URI::Escape' => '0'
  },
  'VERSION' => '0.16',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



