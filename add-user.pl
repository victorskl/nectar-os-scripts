#!/usr/bin/perl

# CSV Input Format (see add-user.csv.sample)
# INDEX_NUM,TEAM_NUMBER,PROJECT_NAME,PROJECT_ID,ENTERED_EMAIL,EXTRACTED_USERNAME,BLANK,LOOKUP_EMAIL,LOOKUP_USERNAME,|

my $file = $ARGV[0] or die "Need csv file";

open(my $data, '<', $file) or die "Could not open file";

my @lostSouls;
my @lsPName;
my @lsEmail;
my @lsAEmail;
my @lsAUser;
my $lsc = 0;
my $lscnt = 0;
while (my $line = <$data>) {
	chomp $line;
	
	my @fields = split(',', $line);

	my $projectName = $fields[2];
	my $projectId = $fields[3];
	my $userName = $fields[5];

	my $actualUserName = $fields[8];
	my $actualEmail = $fields[7];

	$ENV{'OS_PROJECT_NAME'} = $projectName;

	chomp $userName;	
	if($userName eq "") {
		print "Skipping - Empty Username \n";
	}
	else {
		my $added = 0;
		print "Attempting to add $userName to $projectName ...\n";
		my $userEmail = $userName . '@student.unimelb.edu.au';

		my $output = `openstack role add --user $userEmail --project $projectId Member 2>&1`;

		if($output eq "") {
			print "Command Successful\n";
			$added = 1;
		}
		else {

			print "WARNING: Could not add $userEmail : $output \n";
		}
 
		if($added == 0) {
			if($actualEmail ne "") {
				print "Attemping using actual email : [ $actualEmail ] ...\n";
				my $output = `openstack role add --user $actualEmail --project $projectId Member 2>&1`;

				if($output eq "") {
					print "Command Successful\n";
					$added = 1;
				}
				else {
					print "WARNING: Could not add $actualEmail : $output \n";
				}
			}

			if($added == 0) {
				if(($actualUserName ne "") && ($actualUserName ne $userName)) {
					print "Attempting using actual username : [ $actualUserName ] ... \n";	
					my $actualUserEmail = $actualUserName . '@student.unimelb.edu.au';
					my $output = `openstack role add --user $actualUserEmail --project $projectId Member`;
					print "Output: $output \n";
					if($output eq "") {
						print "Command Successful\n";
						$added = 1;
					}
					else {
						print "WARNING: Could not add $actualUserEmail : $output \n";
					}
				}

			}
		}

		print "Added: $added \n";
		if($added == 0) {
			$lsPName[$lscnt] = $projectName;
			$lsEmail[$lscnt] = $userEmail;
			$lsAEmail[$lscnt] = $actualEmail;;
			$lsAUser[$lscnt] = $actualUserName;


			$lscnt++;
			#save for report
		}
		$added = 0;
	}
}

my $lsc = @lostSouls;

print "\n\n lost souls : $lsc \n";

for(my $i=0; $i< $lscnt ; $i++) {

	print "Unable to add student to $lsPName[$i] : Entered Email: [ $lsEmail[$i]  ], Actual Email: [ $lsAEmail[$i] ], Username: [ $lsAUser[$i]] \n";
}


