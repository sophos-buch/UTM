#!/bin/bash
# Konfiguration sichern und in die Dropbox kopieren

# Konfigurationsdatei erstellen
/usr/local/bin/backup.plx -o /tmp/backup.abf

# Datei verschlüsseln
/usr/bin/openssl enc -e -aes-256-cbc -k "password" \
  -md sha512 -in /tmp/backup.abf -out /tmp/backup.abf.enc

# Sicherung in den Cloud-Speicher hochladen
rclone copy /tmp/backup.abf.enc dropbox:"${HOSTNAME}"

if [ $? == 0 ] ; then
  logger -t "${TARGET}" -p syslog.info \
    "Sicherung der Konfiguration nach Dropbox erfolgreich"
  exit 0
else
  logger -t "${TARGET}" -p syslog.error \
    "Sicherung der Konfiguration nach Dropbox fehlgeschlagen"
  exit 1
fi
