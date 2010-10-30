
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'JSON::XS' => '0',
    'Module::Build' => '0.3601',
    'Test::More' => '0',
    'XML::Simple' => '0',
    'YAML' => '0'
  },
  'configure_requires' => {
    'ExtUtils::MakeMaker' => '6.31',
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'REST model class for Catalyst',
  'dist_author' => [
    'Kaare Rasmussen <kaare at cpan dot net>'
  ],
  'dist_name' => 'Catalyst-Model-REST',
  'dist_version' => '0.12',
  'license' => 'perl',
  'module_name' => 'Catalyst::Model::REST',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Carp' => '0',
    'Catalyst::Model' => '0',
    'Data::Serializable' => '0',
    'HTTP::Request::Common' => '0',
    'LWP::UserAgent' => '0',
    'Moose' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'Try::Tiny' => '0',
    'perl' => '5.010'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
