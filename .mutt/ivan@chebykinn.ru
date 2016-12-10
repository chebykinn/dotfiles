# Yandex Mail chebykinn.ru
set imap_user=ivan@chebykinn.ru
set imap_pass=$my_ivan_chebykin_ru_pw
set folder=imaps://imap.yandex.ru/
set spoolfile=+INBOX

set smtp_url=smtps://$imap_user:$imap_pass@smtp.yandex.ru
set realname="Иван Чебыкин"
set from=ivan@chebykinn.ru
set hostname="yandex.ru"
set signature="$HOME/.mutt/sign"
# Connection options
set ssl_force_tls = yes
set send_charset="utf-8"
unset ssl_starttls
set record = +Отправленные
set copy

mailboxes =INBOX
mailboxes imaps://imap.yandex.ru/INBOX imaps://imap.yandex.ru/Отправленные
#account-hook $folder "set imap_user=ivan@chebykinn.ru imap_pass=$my_ivan_chebykin_ru_pw"
# Yandex Mail chebykinn.ru
