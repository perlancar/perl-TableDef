package Sah::Schema::TableSpec;

use 5.010001;
use strict;
use warnings;

# VERSION

our %SCHEMAS;

$SCHEMAS{field_spec} = [
    'hash', # XXX should be 'defhash' later
    keys => {

        # XXX from defhash
        summary   => [
            'str',
        ],

        # XXX from defhash
        description => [
            'str',
        ],

        # XXX from defhash
        tags => [
            'array',
        ],

        # XXX from defhash
        x => [
            'any',
        ],

        schema => [
            'any*' => {of=>['str*','array*']}, # XXX should be 'sah_schema' later
        ],

        pos => [
            'int*',
            min => 0,
            # XXX how to check contiguous and unique
        ],

        req => [
            bool => default=>0,
        ],

        sortable => [
            'bool' => default=>1,
        ],

        filterable => [
            'bool' => default=>1,
        ],

    },
    # XXX from defhash
    'allowed_keys_re' => qr/\A\w+(\.\w+)*\z/,
];

$SCHEMAS{table_spec} = [
    'hash', # XXX should be 'defhash' later
    keys => {

        # XXX from defhash
        summary   => [
            'str',
        ],

        # XXX from defhash
        description => [
            'str',
        ],

        # XXX from defhash
        tags => [
            'array',
        ],

        # XXX from defhash
        x => [
            'any',
        ],

        fields => [
            'array*',
            of => $SCHEMAS{field_spec}, # XXX should be 'field_spec*' (refer by name)
        ],

        pk => [
            'any*' => {of => ['str*', 'array*']},
            # XXX how to check that if string, is one of fields' key?
            # XXX how to check that if array, its element must all be in fields' keys?
        ],
    },
    'keys.restrict' => 0,

    req_keys => [qw/fields pk/],

    # XXX from defhash
    'allowed_keys_re' => qr/\A\w+(\.\w+)*\z/,
];

# XXX how to allow _ANYTHING and blah.blah._ANYTHING, but allow known TableSpec properties only?

1;
# ABSTRACT: Sah schemas to validate TableSpec

=head1 SYNOPSIS

 # schemas are put in the %SCHEMAS package variable


=head1 DESCRIPTION

This module contains L<Sah> schemas to validate L<SHARYANTO::TableSpec> specs.


=head1 SCHEMAS

=over

=item * table_spec

=item * field_spec

=back


=head1 SEE ALSO

L<Sah>, L<Data::Sah>

L<SHARYANTO::TableSpec>
