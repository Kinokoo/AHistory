#!/usr/bin/perl -w
use Term::ANSIColor qw(:constants);

($^O eq "darwin")
    or die "Sorry, only Mac OS X supported.\n";

open (LOGFILE, "<", "/var/log/system.log") 
    or die "Cannot open system log\n";

while (<LOGFILE>) 
{
    print RED, $1." - Login refused.\n", RESET
        if (m/(.*)\s+loginwindow.*OpenDirectory.*The authtok is incorrect/);

    print $1." - Authentication passed.\n"
        if (m/(.*)\s+loginwindow.*OpenDirectory.*Membership cache TTL set to/);
}

close (LOGFILE);
