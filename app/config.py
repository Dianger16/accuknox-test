"""Configuration with planted secrets (fake values)."""

DATABASE = {
    "host": "db.internal.lab",
    "user": "labadmin",
    # PLANTED (secret scan): hard-coded database password.
    "password": "SuperSecret-Lab-Passw0rd!",
}

DEBUG = True  # PLANTED (SAST): debug mode on in a config shipped to production
