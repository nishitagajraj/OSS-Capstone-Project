# oss-Capstone Project-24BCE10761

**Course:** Open Source Software (NGMC) — VIT Bhopal University  
**Student:** Nishita &nbsp;|&nbsp; `24BCE10761`  
**Software:** LibreOffice  

---

## What this project is

A structured audit of LibreOffice as part of the OSS capstone. The report covers where it came from, what its license actually means, how it lives on a Linux system, and how it compares to Microsoft Office. The five shell scripts demonstrate practical Linux and bash concepts from Units 1–5.

---

## Files in this repo

```
oss-audit-24BCE10761/
│
├── scripts/
│   ├── script1_system_identity.sh      # system welcome screen
│   ├── script2_package_inspector.sh    # package check + philosophy note
│   ├── script3_disk_auditor.sh         # directory permissions + sizes
│   ├── script4_log_analyzer.sh         # keyword counter in log files
│   ├── script5_manifesto_generator.sh  # interactive manifesto writer
│   └── test.log                        # sample log for script 4
│
├── screenshots/
│   ├── script1_output.png
│   ├── script2_output.png
│   ├── script3_output.png
│   ├── script4_output.png
│   └── script5_output.png
│
├── report/
│   └── OSS_Capstone_Nishita_24BCE10761.pdf
│
└── README.md
```

---

## Running the scripts

All scripts were tested on Ubuntu 24.04 LTS. Make them executable first:

```bash
chmod +x scripts/*.sh
```

#### Script 1 — System Identity Report
```bash
bash scripts/script1_system_identity.sh
```
Prints distro, kernel version, logged-in user, uptime, date/time, and the OS license.

#### Script 2 — Package Inspector
```bash
bash scripts/script2_package_inspector.sh
```
Checks if `libreoffice` is installed via `dpkg`. Prints version details if found, and runs a `case` statement to display a philosophy note about the package.

#### Script 3 — Disk and Permission Auditor
```bash
bash scripts/script3_disk_auditor.sh
```
Loops through `/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp` and prints permissions, owner, and size for each. Also checks for the LibreOffice user config directory.

#### Script 4 — Log File Analyzer
```bash
# with a real log
bash scripts/script4_log_analyzer.sh /var/log/syslog error

# with the included test log
bash scripts/script4_log_analyzer.sh scripts/test.log error
```
Accepts a log file and keyword as arguments. Counts matching lines, retries if file is missing, and prints the last 5 matches.

#### Script 5 — Manifesto Generator
```bash
bash scripts/script5_manifesto_generator.sh
```
Asks three questions interactively. Saves a personalised open source philosophy statement to `manifesto_<username>.txt`.

---

## Dependencies

- Bash 4+
- Standard GNU utilities: `awk`, `grep`, `cut`, `du`, `dpkg`
- Linux (tested on Ubuntu 24.04)

Scripts 2 and 3 give their most complete output when LibreOffice is installed — on systems without it, both scripts detect and report its absence correctly.

---

## About LibreOffice

LibreOffice is an open-source office suite released under **MPL 2.0 / LGPLv3+**, maintained by The Document Foundation. It was forked from OpenOffice.org in 2010 after Oracle acquired Sun Microsystems, and is now the most widely deployed free office suite in the world. Its default file format is the OpenDocument Format (ODF), an ISO-standardised open standard.

Components: Writer · Calc · Impress · Draw · Base · Math
