post curl -s --user 'api:key-bb8533730fe5ae944eee3719d34bfeb6' \
post     https://api.mailgun.net/v3/sandbox385a3c70a08f4eeabd647c59a67221a0.mailgun.org/messages \
post     -F from='Excited User <mailgun@sandbox385a3c70a08f4eeabd647c59a67221a0.mailgun.org>' \
post     -F to=leogaboardi@gmail.com \
post     -F to=bar@example.com \
post     -F subject='Hello' \
post     -F text='Testing some Mailgun awesomness!'
