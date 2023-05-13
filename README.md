# SPiC-WSL

Anleitung zur Installation der SPiC Entwicklungsumgebung unter Windows

## Installation

Die Installation nutzt ungeprüfte Quellen und erfolgt daher auf eigene Gefahr.
Es werden ungefähr 5 GB Speicherplatz benötigt.

### WSL

Das Windows Subsystem für Linux ist die Basis dieser Anleitung.
Die Installation wird in der Kommandozeile ausgeführt.
Dazu einfach aus dem Startmenü die `Eingabeaufforderung` öffnen.

```
wsl --update
wsl --install -d Debian
```

Es ist wichtig sich das Passwort zu merken, welches bei der Installation von WSL angegeben wurde.

Nach der Installation startet WSL automatisch.
Der Befehl `exit` beendet es wieder.

Sollte es Probleme bei der Installation geben, gibt es [hier](https://learn.microsoft.com/de-de/windows/wsl/install) eine genauere Anleitung.

### WSL USB

Um die Programmierung des SPiC Boards zu ermöglichen, muss die USB Schnittstelle an WSL weitergereicht werden.

Am einfachsten ist dies mittels der grafischen Anwendung WSL USB, welche [hier](https://gitlab.com/alelec/wsl-usb-gui/-/releases) heruntergeladen werden kann.
Beim Ausführen der `.msi` Datei wird eventuell eine Warnung angezeigt.
Diese umgeht man über `Weitere Informationen` und `Trotzdem ausführen`.

Alternativ ist auch die Verwendung eines Kommandozeilen-Tools möglich.
Das dafür benötigte Programm wird mittels `winget` installiert.

```
winget install --interactive --exact dorssel.usbipd-win
```

Hinweise zur Nutzung dieses Tools gibt es [hier](https://learn.microsoft.com/de-de/windows/wsl/connect-usb#attach-a-usb-device).

### SPiC Entwicklungsumgebung

Zuletzt wird die Entwicklungsumgebung in WSL installiert.

Dazu einfach aus dem Startmenü `Debian` öffnen.
Die Installation fragt wahrscheinlich das Passwort ab, welches bei der Installation von WSL festgelegt wurde.

Ab diesem Punkt gibt es zwei Varianten der weiteren Installation:

Ein fertiges Skript kann in WSL heruntergeladen und ausgeführt werden.
Dieser Weg hat den Vorteil, dass zusätzliche Skripte zur Abgabe heruntergeladen werden.

```
sudo apt install -y git
git clone https://github.com/MaxM3001/SPiC-WSL.git ~/SPiC-WSL
bash ~/SPiC-WSL/install.sh
```

Um Abgaben zu ermöglichen, generiert der Skript am Ende einen SSH Key und legt diesen im CIP Benutzeraccount an.
Dafür werden Nutzername und Passwort des Informatik CIP abgefragt.

Alternativ können alle Befehle einzeln ausgeführt werden.

```
sudo apt update
sudo apt upgrade -y
sudo apt install -y wget make udev gnupg apt-transport-https usbip hwdata usbutils
sudo /lib/systemd/systemd-udevd --daemon
wget -O - https://i4spic.cs.fau.de//editor/repo.gpg.key | sudo apt-key add -
echo "deb https://i4spic.cs.fau.de//editor/debian buster main" | sudo tee /etc/apt/sources.list.d/spic.list
sudo apt update
sudo apt install -y spic-editor
```

Die Installation ist abgeschlossen, sobald alle Befehle ohne Fehlermeldungen ausgeführt wurden.

## Benutzung

### Start der IDE

Die Installation sollte eine Verknüpfung im Startmenü erstellt haben, wo die `SPiC IDE` im Ordner `Debian` zu finden ist.

Der Simulator kann wie gewohnt aus der IDE gestartet werden.

### Flashen des SPiC Boards

Um ein SPiCBoard zu flashen muss zuerst die `WSL USB` Anwendung gestartet werden.
Es ist sinnvoll sich die angezeigten USB Geräte zu merken.

Nun kann das SPiC Board angesteckt werden.
Nach einem `Refresh` sollte das Board als `Serielles USB-Gerät` hinzugekommen sein.

Dieses kann ausgewählt und mittels `Auto-Attach Device`, `Port` automatisch weitergereicht werden.
Um diese Weiterreichung zu nutzen ist es wichtig das `WSL USB` Programm vor der `SPiC IDE` zu starten.
Für den Simulator ist dieser Schritt nicht notwendig.

### Einschränkungen

Die lokale Installation ist nicht in das Abgabesystem integriert.
Daher ist es nicht möglich Funktionen wie die Abgabe oder das Ansehen der Musterlösung in der IDE zu nutzen.

### Abgaben

Wenn die Entwicklungsumgebung mithilfe des Skripts installiert wurde, ist es möglich die Aufgaben auch von Zuhause abzugeben.

Dafür gibt es einige Skripte, welche in WSL (`Debian` im Startmenü) ausführbar sind:

```
bash ~/SPiC-WSL/submit.sh
```

- Gibt die angegebene Aufgabe ab

```
bash ~/SPiC-WSL/show-submission.sh
```

- Zeigt die angegebene Abgabe an

```
bash ~/SPiC-WSL/get-deadline.sh
```

- Zeigt den Abgabetermin der angegebenen Aufgabe an

Falls die Installation manuell erfolgte, muss zuerst der `login.sh` Skript heruntergeladen und ausgeführt werden.

```
mkdir ~/SPiC-WSL
wget https://raw.githubusercontent.com/MaxM3001/SPiC-WSL/main/login.sh -o ~/SPiC-WSL/login.sh
bash ~/SPiC-WSL/login.sh
````

Der folgende Befehl lädt weitere Skripte einzeln herrunter.
Dabei ist es wichtig `$SKRIPT` durch den Name des Skripts zu ersetzen.

```
wget https://raw.githubusercontent.com/MaxM3001/SPiC-WSL/main/$SKRIPT -o ~/SPiC-WSL/$SKRIPT
```
