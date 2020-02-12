use strict;
use warnings;

my (
  $filename_input,
  $fh_input,
  $row,
  $new_row,
  $filename_output,
  $fh_output,
);

$filename_input = 'output_1.txt';
$filename_output = 'output_2.txt';

open($fh_input, '<', $filename_input)
  or die "Não foi possível abrir o arquivo '$filename_input' $!";

open($fh_output, '>', $filename_output) 
  or die "Não foi possível abrir o arquivo '$filename_output' $!";

while ($row = <$fh_input>) {
  chomp $row;
  if ( $row !~ /^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/ ) {
    print $fh_output "$row\n";
  } else {
    my (
      $col01,
      $col02,
      $col03,
      $col04,
      $col05,
      $col06,
      $col07,
      $col08,
      $col09,
      $col10,
      $col11,
      $col12
    ) = split /\s+/, $row;

    $new_row  = sprintf("%-18s", $col01);
    $new_row .= sprintf("%-11s", $col02);
    $new_row .=  $col03."   ";
    $new_row .=  $col04."   ";
    $new_row .=  $col05."   ";
    $new_row .=  $col06."   ";
    $new_row .=  $col07."   ";
    $new_row .=  $col08."   ";
    $new_row .=  $col09."   ";
    $new_row .=  $col10."   ";
    $new_row .=  $col11.$col12 if ( ($col11) );

    print $fh_output "$new_row\n";
  }
}
close $fh_input;
close $fh_output;
print "Pronto\n";