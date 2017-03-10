package Sah::Schema::tabledef::field_def;

use strict;
use warnings;

our $schema = [hash => { # XXX should be 'defhash' later
    summary => 'Field definition',
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

        schema => {},
        pos => {},
        req => {},
        sortable => {},
        filterable => {},
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
}, {}];

1;
# ABSTRACT:
