#!/usr/bin/perl

my $file = $ARGV[0] or die "Need csv file";

open(my $data, '<', $file) or die "Could not open file";

while (my $line = <$data>) {
	chomp $line;
	
	my @fields = split(',', $line);

	my $projectName = $fields[2];
	my $projectId = $fields[3];
	my $userName = $fields[5];

    $ENV{'OS_PROJECT_NAME'} = $projectName;

	chomp $userName;	
	if($userName eq "") {
		print "Skipping - Empty Username \n";
	}
	else {
		print "Attempting to add $userName to $projectName ...\n";
		my $userEmail = $userName . '@student.unimelb.edu.au';
		#print "openstack role add --user $userEmail --project $projectId Memeber \n";
		my $output = `openstack role add --user $userEmail --project $projectId Member`;
		print "Output: $output \n"
	}
}
