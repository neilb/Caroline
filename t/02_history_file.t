use strict;
use warnings;
use utf8;
use Test::More;
use Caroline;
use File::Temp;

my $tmpfile = File::Temp->new();

# write to file
{
    my $c = Caroline->new();
    $c->history_add('a');
    $c->history_add('b');
    $c->history_add('c');
    $c->write_history_file($tmpfile);
}

# read from file
{
    my $c = Caroline->new();
    $c->read_history_file($tmpfile);
    is_deeply($c->history, [qw(a b c)]);
}

done_testing;

