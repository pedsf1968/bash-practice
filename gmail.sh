#!/usr/bin/env bash

USER_NAME=root
USER_MAIL=pedsf.fullstack@gmail.com
USER_PASSWORD=mmvmobqjywotxbao

testRoot(){
	if [[ $(id -u) -ne 0 ]]
	then
  	echo "Please run this script from root only"
    exit 1
	fi
}

testOs(){
	if [[ $(cat /etc/os-release | awk -F= '/NAME=/  && NR==2 { print $2 }' | tr -d '"' | tr [A-Z] [a-z] ) != ubuntu ]]
	then
    echo "This script works for only ubuntu"
    exit 2
	fi
}

mailPackageInstall(){
	# Install mailsender
	apt-get update -y
	apt-get install sendmail mailutils -y
}


mailConfigure(){
	# Create authentication file
	mkdir -m 700 /etc/mail/authinfo

	echo AuthInfo: "U:${USER_NAME}" "I:${USER_MAIL}" "P:${USER_PASSWORD}" > /etc/mail/authinfo/gmail


	# Create hash file
	makemap hash /etc/mail/authinfo/gmail < /etc/mail/authinfo/gmail
	rm /etc/mail/authinfo/gmail

	# Add the following lines to sendmail.mc

	echo "
define(\`SMART_HOST',\`[smtp.gmail.com]')dnl
define(\`RELAY_MAILER_ARGS', \`TCP $h 587')dnl
define(\`ESMTP_MAILER_ARGS', `\TCP $h 587')dnl
define(\`confAUTH_OPTIONS', `\A p')dnl
TRUST_AUTH_MECH(\`EXTERNAL DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl
define(\`confAUTH_MECHANISMS', \`EXTERNAL GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl
FEATURE(\`authinfo',\`hash -o /etc/mail/authinfo/gmail.db')dnl 
" > /tmp/sendmail.conf

	sed $'/^MAILER_DEFINITIONS/{e cat /tmp/sendmail.conf\n}' /etc/mail/sendmail.mc > /tmp/sendmail.mc

	cp /tmp/sendmail.mc /etc/mail/sendmail.mc

	make -C /etc/mail
}

mailServiceRestart(){
	systemctl daemon-reload
	systemctl restart sendmail
}



mailSend(){
   # send mail
   MAIL_MESSAGE="Hello, I am from $(hostname)"
   MAIL_SUBJECT="Testing Gmail Setup on Ubuntu Server"

   echo "${MAIL_MESSAGE}" | mail -s "${MAIL_SUBJECT}" "${USER_MAIL}"
}

main() {
   testRoot
   testOs
#   mailPackageInstall
   mailConfigure
	 mailServiceRestart
   mailSend
}

main
