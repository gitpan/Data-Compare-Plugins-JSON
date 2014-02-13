package Data::Compare::Plugins::JSON;

use strict;
use warnings;

use Data::Compare qw(Compare);


our $VERSION = '1.02';


sub _compare_object_and_object {
	return $_[0] eq $_[1] ? 1 : 0;
}

sub _compare_object_and_scalar {
	return Compare(${$_[0]}, $_[1]) if ref($_[0]);
	return Compare($_[0], ${$_[1]});
}


[
	['JSON::PP::Boolean',     \&_compare_object_and_object],
	['JSON::PP::Boolean', '', \&_compare_object_and_scalar],
	['JSON::XS::Boolean',     \&_compare_object_and_object],
	['JSON::XS::Boolean', '', \&_compare_object_and_scalar],
];


__END__

=head1 NAME

Data::Compare::Plugins::JSON - Plugin for Data::Compare to handle JSON::PP and JSON::XS boolean constants.

=head1 DESCRIPTION

L<JSON::PP> and L<JSON::XS> provides instances of JSON::PP::Boolean and
JSON::XS::Boolean classes. It's JSON::PP::true, JSON::PP::false,
JSON::XS::true, and JSON::XS::false. This plugin enables L<Data::Compare> to
compare this values.

=over 4

=item comparing a JSON::PP::Boolean or JSON::XS::Boolean object and an
ordinary scalar

If you compare a scalar and a JSON::PP::Boolean or JSON::XS::Boolean object,
then they will be compared as scalar and C<0> (for *::false) or C<1> (for
*::true).

=item comparing two JSON::PP::Boolean or JSON::XS::Boolean objects

If you compare two JSON::PP::Boolean or JSON::XS::Boolean objects, then they
will be considered the same if two values are equal for C<==> operator.

=back

=head1 SEE ALSO

L<Data::Compare>.

=head1 SUPPORT

=over 4

=item Repository

L<http://github.com/dionys/data-compare-plugins-json>

=item Bug tracker

L<http://github.com/dionys/data-compare-plugins-json/issues>

=back

=head1 AUTHOR

Denis Ibaev, C<dionys@cpan.org> for Setup.ru.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013-2014, Denis Ibaev.

This program is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

See L<http://dev.perl.org/licenses/> for more information.

=cut
