# Destructive JAPH
@x = map{ x($_) } split('','Just another Perl hacker,');
shift(@x) while @x;
sub x{ bless \$_[0],"x"}
sub x::DESTROY{print ${$_[0]}}
