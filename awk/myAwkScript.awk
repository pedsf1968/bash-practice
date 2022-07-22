BEGIN { 
   print "======= Working on /etc/password =======" 
} 
/root/ {
   print $0 
} 
END { 
   print "=============== Completed =============="
}
