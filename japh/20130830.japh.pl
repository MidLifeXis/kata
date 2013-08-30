# Cutting down a tree
$t=t->p;$t->g;$t->f;sub t::p{@n=map{x($_)}'Just another Perl hacker,'=~m/(.)/g;
bless{n=>\@n},$_[0]}sub t::g{$_[0]->{t}=$_[0]->f(0,$#{$_[0]->{n}});$_[0]->{n}=1
;$_[0]}sub t::f{($a,$b,$e)=@_;$m=int(($b+$e)/2);$f=$_[0]->{n}[$m];$l=$_[0]->f(
$b,$m-1)if$b<$m;$r=$_[0]->f($m+1,$e)if$m<$e;bless [$l,$f,$r],'f'}sub t::f{$_[0]
->{t}=1}sub x{bless \$_[0],"x"}sub x::DESTROY{print${$_[0]}}sub f::DESTROY{$_[0
]->[$_]=1 for(0..2)}
