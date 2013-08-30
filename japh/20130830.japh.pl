# Cutting down a tree
use strict;
use warnings;
my $sapling = tree->plant;
my $tree = $sapling->grow;
$tree->fall;
sub tree::plant {
    my @nodes = map{ x($_) } split('','Just another Perl hacker,');
    bless { nodes => \@nodes }, $_[0];
}
sub tree::grow {
    $_[0]->{trunk} = $_[0]->branch( 0, $#{$_[0]->{nodes}} );
    $_[0]->{nodes} = undef;
    $_[0]
}
sub tree::branch {
    my ( $self, $start, $stop ) = @_;
    my $mid = int( ( $start + $stop ) / 2 );
    my $fork  = $self->{nodes}[$mid];
    my $left  = $self->branch( $start,   $mid - 1 ) if $start < $mid;
    my $right = $self->branch( $mid + 1, $stop  )   if $mid   < $stop;
    bless [ $left, $fork, $right ], 'branch';
}
sub tree::fall {
    $_[0]->{trunk} = undef;
}
sub x{ bless \$_[0],"x"}
sub x::DESTROY{print ${$_[0]}}
sub branch::DESTROY{$_[0]->[$_] = 1 for (0..2)}
