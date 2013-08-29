# Destructive JAPH
@y=map{x($_)}split('','Just another Perl hacker,');shift(@y)while@y;sub x{bless
\$_[0],"x"};package x;sub DESTROY{print ${$_[0]}}
