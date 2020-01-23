#!/usr/bin/awk -f
BEGIN {
	FS = ",";
}
{
	for ( i = 3; i < NF; i++ )
		if ( NR == 1 )
			city[i] = $i;
		else if ( $i > c[i] ) {
			c[i] = $i;
			d[i] = $1;
		}
}
END {
	for ( i in c )
		print city[i] ":" c[i] " (" d[i] ")";
}

