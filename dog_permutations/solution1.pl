use strict;
use warnings;

my @dogs =

    qw( TOYOTA HONDA AUDI FORD );

# qw(

# Affenpinscher AfghanHound AiredaleTerrier Akita AlaskanMalamute
# AmericanEnglishCoonhound AmericanEskimoDog AmericanFoxhound Basenji
# BassetHound Beagle BeardedCollie Beauceron BlackandTanCoonhound
# Bloodhound BluetickCoonhound BorderCollie BorderTerrier Borzoi
# BostonTerrier BouvierdesFlandres Boxer BoykinSpaniel Briard Brittany
# BrusselsGriffon BullTerrier Bulldog Bullmastiff ChesapeakeBayRetriever
# Chihuahua ChineseCrested ChineseShar-Pei Chinook ChowChow
# ClumberSpaniel CockerSpaniel Collie Curly-CoatedRetriever Dachshund
# Dalmatian DandieDinmontTerrier DobermanPinscher DoguedeBordeaux
# EnglishCockerSpaniel EnglishFoxhound EnglishSetter
# EnglishSpringerSpaniel GermanPinscher GermanShepherdDog
# GermanShorthairedPointer GermanWirehairedPointer GiantSchnauzer
# GlenofImaalTerrier GoldenRetriever GordonSetter GreatDane Greyhound
# Harrier IbizanHound IcelandicSheepdog IrishSetter IrishTerrier Kuvasz
# LabradorRetriever LakelandTerrier LhasaApso Lowchen Maltese
# ManchesterTerrier Mastiff MiniatureBullTerrier MiniaturePinscher
# MiniatureSchnauzer NeapolitanMastiff Newfoundland NorfolkTerrier
# Pekingese PembrokeWelshCorgi PharaohHound Plott PortugueseWaterDog Pug
# Puli PyreneanShepherd RatTerrier ShibaInu ShihTzu SiberianHusky
# SilkyTerrier SkyeTerrier SmoothFoxTerrier SoftCoatedWheatenTerrier
# SpinoneItaliano St.Bernard StaffordshireBullTerrier WireFoxTerrier
# WirehairedPointingGriffon Xoloitzcuintli YorkshireTerrier

# );

#my $alphabet = 'A(8),B(2),C(5),8(D),7(E),F(1),G(3),H(9),I(8),K(1),L(9),M(1),N(12),O(13),P(1),Q(0),R(5),S(6),T(4),U(6),V(0),W(1),X(1),Y(0),Z(0)';
my $alphabet = 'A(1),D(2),F(1),I(1),O(1),R(1),U(1)';

my @alphabet = (0) x 26;
while ($alphabet =~ m/([A-Z])\((\d+)\)/g) {
    $alphabet[ ord( $1 ) - ord( 'A' ) ] = int($2);
}

use Data::Dumper;

print Dumper( \@dogs, \@alphabet );

sub get_reduced_alphabet {
    my ( $choice, $alphabet ) = @_;

    my @letters   = (0) x 26;
    
    for ( split '', uc($choice) ) {
	$letters[ ord($_) - ord( 'A' ) ]++;
    }

    my @results = map { $alphabet->[$_] - $letters[$_] } ( 0 .. 25 );

    if ( grep { $_ < 0 } @results ) {
	return;
    }
    else {
	return [ @results ];
    }
}    

sub find_span {
    my ( $choices, $alphabet ) = @_;

    my $results = [];
    while (my $choice = shift @$choices ) {
        if ( my $new_alphabet = get_reduced_alphabet( $choice, $alphabet ) ) {
            push @$results, [ $choice, find_span( [ @$choices ], $new_alphabet ), join( ',', @$new_alphabet ) ];
        }
    }
    return $results;
}

my $results = find_span( [ @dogs ], [ @alphabet ] );

print Dumper( $results );
