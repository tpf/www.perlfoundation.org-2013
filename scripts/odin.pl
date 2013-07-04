#!/usr/bin/perl

use CGI qw/:standard/;
use Mail::Sendmail;
use strict;
use warnings;

## I know, old old CGI
my $deploy = CGI->new;
print header,start_html();

## Rough check for Github addresses
if( remote_addr() =~ /204.232.175/ || remote_addr() =~ /192.30.252/)
{
    # Adam M Dutko
#    || remote_addr() =~ /68.109.235.119/) {

    ## DEBUG
    #print html("Allowed.");

    ## Get the latest code
    `git pull`;

    ## Copy contents
    `cp -rp www/ ../`;

    sendmail(
        From => 'perlfoun@qs598.pair.com',
        To   => 'adam@oktud.com',
        Subject => 'NOTICE - Code Pulled',
        Message => 'Code was pulled by ' . remote_addr(),
    );

} else {

    ## Be polite to others
    print html("Hello, how can I help you?<br />");

}

end_html;
