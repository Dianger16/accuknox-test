"""Deliberately vulnerable sample code. Never run or deploy this."""
import sqlite3
import subprocess

# PLANTED (secret scan): AWS-shaped key pair. Fake, not a real credential.
AWS_ACCESS_KEY_ID = "AKIAIOSFODNN7EXAMPLE"
AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"

# PLANTED (secret scan): hard-coded API token.
INTERNAL_API_TOKEN = "sk_live_lab_51H8xFakeTokenForScannerTesting0000"


def get_user(username):
    """PLANTED (SAST): SQL injection via string concatenation."""
    conn = sqlite3.connect("app.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users WHERE name = '" + username + "'")
    return cursor.fetchall()


def ping(host):
    """PLANTED (SAST): command injection via shell=True on user input."""
    return subprocess.check_output("ping -c 1 " + host, shell=True)


def run_payload(data):
    """PLANTED (SAST): eval on untrusted input."""
    return eval(data)  # noqa: S307
