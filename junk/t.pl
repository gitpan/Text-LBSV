#!/usr/bin/env perl
# Time-stamp: <2013-02-08 15:23:47 JST, hirose31>

use strict;
use warnings;
use IO::File;
STDOUT->autoflush(1);
STDERR->autoflush(1);
use Data::Dumper;
$Data::Dumper::Indent   = 1;
$Data::Dumper::Deepcopy = 1;
$Data::Dumper::Sortkeys = 1;
BEGIN {
    use UNIVERSAL::require;
    Data::Printer->use or do {
        sub pp(@) {
            my $d =  Dumper(\@_);
            $d    =~ s/x{([0-9a-z]+)}/chr(hex($1))/ge;
            print $d;
        }
        *p = \&pp;
    };
}

use FindBin;
use File::Spec;
use lib map {File::Spec->catfile($FindBin::Bin, @$_)} [qw(.. lib)], [qw(.. blib lib)], [qw(.. blib arch)];

# ==========================================================================

use Text::LBSV;
my $p = Text::LBSV->new;
my $lbsv = Text::LBSV->new(
           hoge => 'foo',
           bar  => 'baz',
         );
print $lbsv->to_s,"\n";


__END__

# for Emacsen
# Local Variables:
# mode: cperl
# cperl-indent-level: 4
# indent-tabs-mode: nil
# coding: utf-8
# End:

# vi: set ts=4 sw=4 sts=0 :
