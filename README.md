# aspm-test-repo

A deliberately vulnerable mini-app used to test AccuKnox ASPM (Module 6),
Static Security / SBOM (Module 11) and secret scanning.

**Do not deploy this.** It exists so a scanner has something to find. Push it
to a PRIVATE GitHub repository only.

What is planted, and which scan should catch it:

| File | Planted problem | Scan |
| --- | --- | --- |
| `app/vulnerable.py` | SQL injection via string concatenation | SAST |
| `app/vulnerable.py` | `subprocess` with `shell=True` on user input | SAST |
| `app/vulnerable.py` | Hard-coded AWS-shaped key and API token | Secret |
| `app/config.py` | Hard-coded database password | Secret |
| `requirements.txt` | Old packages with known CVEs | SCA |
| `Dockerfile` | Old base image, runs as root | IaC (the workflow runs SBOM in filesystem mode) |
| `terraform/main.tf` | Public S3 bucket, open security group | IaC |

The fake credentials are syntactically valid but not real. They still trip
GitHub push protection on public repos, which is why this stays private.
