#!/usr/bin/env perl

use 5.008000;
use strict;
use warnings;

use ExtUtils::MakeMaker;


WriteMakefile(
	NAME           => 'Data::Compare::Plugins::JSON',
	AUTHOR         => 'Denis Ibaev <dionys@cpan.org>',
	VERSION_FROM   => 'lib/Data/Compare/Plugins/JSON.pm',
	ABSTRACT_FROM  => 'lib/Data/Compare/Plugins/JSON.pm',
	LICENSE        => 'perl',
	META_MERGE     => {
		requires  => {perl => '5.008000'},
		resources => {
			license     => 'http://dev.perl.org/licenses/',
			repository  => 'http://github.com/dionys/data-compare-plugins-json',
			bugtracker  => 'http://github.com/dionys/data-compare-plugins-json/issues',
		},
		no_index  => {directory => ['t']},
	},
	BUILD_REQUIRES => {
		'Test::More'    => 0,
	},
	PREREQ_PM      => {
		'Data::Compare' => 0,
	},
	dist           => {COMPRESS => 'gzip -9f', SUFFIX => 'gz'},
	clean          => {FILES => 'Data-Compare-Plugins-JSON-*'},
	test           => {TESTS => 't/*.t'},
);
