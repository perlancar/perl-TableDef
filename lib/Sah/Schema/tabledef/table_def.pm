package Sah::Schema::tabledef::table_def;

use strict;
use warnings;

our $schema = [hash => { # XXX should be 'defhash' later
    summary => 'Table definition',

    # tmp
    _prop => {
        # from defhash
        v => {},
        defhash_v => {},
        name => {},
        summary => {},
        description => {},
        tags => {},
        x => {},

        fields => {},
        pk => {},
    },

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
            of => ['tabledef::field_def', {req=>1}, {}],
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
}, {}];

1;
# ABSTRACT:
