# Cutting down a tree
$t=t->plant;$t->grow;$t->fall;sub t::plant{@n=map{x($_)}split('','Just another'.
' Perl hacker,');bless{n=>\@n},$_[0]}sub t::grow{$_[0]->{trunk}=$_[0]->branch(0,
$#{$_[0]->{n}});$_[0]->{n}=undef;$_[0]}sub t::branch{($a,$b,$e)=@_;$m=int(($b+$e
)/2);$f=$_[0]->{n}[$m];$l=$_[0]->branch($b,$m-1)if$b<$m;$r=$_[0]->branch($m+1,$e
)if$m<$e;bless [$l,$f,$r],'branch'}sub t::fall{$_[0]->{trunk}=1}sub x{bless \$_[
0],"x"}sub x::DESTROY{print${$_[0]}}sub branch::DESTROY{$_[0]->[$_]=1 for(0..2)}
