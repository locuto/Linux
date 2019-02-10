#!/usr/bin/perl
# Pass in command line parameter "--test" to perform an email test.

use Sys::Hostname;
$host = hostname();

if (($host eq "CPDB1") || ($host eq "CPDB4") ) {
    $bkpdev = "/opt/sap/db_backups";
}
else
{
   $bkpdev = "/home/sybase/db_backups";
}

#$to='CANPARDatabaseAdministratorsStaffList@canpar.com';
$default_warning_level=85;

sub check_free_space {
my $out = "";
my ($dir, $warning_level) = @_;
# set warning level to default if not specified
if(!defined($warning_level)) {
	$warning_level = $default_warning_level;
}

my $res=`df $dir | tail -n 1`;
my ($dev, $total, $used, $avail, $use_perc) = split(/\s+/,$res);

$up = $used / $total * 100;

# compare
if (($up > $warning_level) || (defined($ARGV[0]) && ($ARGV[0] eq "--test"))) {
	$out .= sprintf("WARNING Low Disk Space on $dir : %0.2f%% of space used on the device. \n\n Check the /tmp, /var/log and /opt/sap folders as they are generally the ones that give more trouble. If you need to tweak this alert, change the script /opt/sap/cron_scripts/monitor-disk-space.pl. \n",$use_perc);
}
	
if($out ne "") {
#print $out;
`/usr/sbin/sendmail -t -i <<EOF
To: CANPARDatabaseAdministratorsStaffList\@canpar.com
Subject:   $host Low Disk Space

$out
EOF
`;	
close(MAIL);
}
}

check_free_space("/", 80);
check_free_space($bkpdev, 90);